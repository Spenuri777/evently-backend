import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PaginationParams } from 'src/params/pagination.params';
import { User } from 'src/user/entities/user.entity';
import { Between, Repository } from 'typeorm';
import { CreateEventDto } from './dto/create-event.dto';
import {
  FindParticipantsParams,
  ParticipantSort,
} from './dto/find-participants.params';
import { UpdateEventDto } from './dto/update-event.dto';
import { Event } from './entities/event.entity';
import { Rating } from './entities/rating.entity';
import { Registration } from './entities/registration.entity';
import { FindEventsParams } from './find-events.params';

@Injectable()
export class EventsService {
  constructor(
    @InjectRepository(Event)
    private readonly eventsRepository: Repository<Event>,

    @InjectRepository(Registration)
    private readonly registrationsRepository: Repository<Registration>,

    @InjectRepository(Rating)
    private readonly ratingsRepository: Repository<Rating>,
  ) {}

  async findAll(
    filters: FindEventsParams,
    pagination: PaginationParams,
    userId?: string,
  ): Promise<[Event[], number]> {
    const qb = this.eventsRepository.createQueryBuilder('event');
    qb.leftJoinAndSelect('event.organizer', 'organizer');

    if (filters.search) {
      qb.andWhere('LOWER(event.title) LIKE LOWER(:search)', {
        search: `%${filters.search}%`,
      });
    }

    if (filters.type) {
      qb.andWhere('event.type = :type', { type: filters.type });
    }

    if (filters.dateFrom && filters.dateTo) {
      qb.andWhere('event.date BETWEEN :dateFrom AND :dateTo', {
        dateFrom: filters.dateFrom,
        dateTo: filters.dateTo,
      });
    } else if (filters.dateFrom) {
      qb.andWhere('event.date >= :dateFrom', { dateFrom: filters.dateFrom });
    } else if (filters.dateTo) {
      qb.andWhere('event.date <= :dateTo', { dateTo: filters.dateTo });
    }

    if (filters.myRegistrations !== undefined && userId) {
      if (filters.myRegistrations === true) {
        qb.andWhere(
          `EXISTS (
            SELECT 1 FROM registrations r 
            WHERE r.event_id = event.id AND r.user_id = :userId
          )`,
          { userId },
        );
      } else {
        qb.andWhere(
          `NOT EXISTS (
            SELECT 1 FROM registrations r 
            WHERE r.event_id = event.id AND r.user_id = :userId
          )`,
          { userId },
        );
      }
    }

    qb.skip(pagination.offset);
    qb.take(pagination.limit);

    return await qb.getManyAndCount();
  }

  async findOneWithDetails(id: string, userId?: string) {
    const event = await this.eventsRepository.findOne({
      where: { id },
      relations: ['organizer'],
    });

    if (!event) {
      throw new NotFoundException('Wydarzenie nie istnieje');
    }

    const participantCount = await this.registrationsRepository.count({
      where: { event_id: id },
    });

    const ratingResult = await this.ratingsRepository
      .createQueryBuilder('r')
      .select('AVG(r.rating)', 'avg')
      .addSelect('COUNT(r.id)', 'count')
      .where('r.event_id = :id', { id })
      .getRawOne<{ avg: string | null; count: string }>();

    const avgRating = ratingResult?.avg ? parseFloat(ratingResult.avg) : null;
    const ratingCount = ratingResult ? parseInt(ratingResult.count, 10) : 0;

    let isRegistered = false;
    let userRating: number | null = null;

    if (userId) {
      isRegistered = await this.registrationsRepository.exists({
        where: { event_id: id, user_id: userId },
      });

      const ratingEntity = await this.ratingsRepository.findOne({
        where: { event_id: id, user_id: userId },
      });

      userRating = ratingEntity ? ratingEntity.rating : null;
    }

    return {
      ...event,
      participant_count: participantCount,
      avg_rating: avgRating,
      rating_count: ratingCount,
      is_registered: isRegistered,
      user_rating: userRating,
    };
  }

  async create(createEventDto: CreateEventDto, user: User): Promise<Event> {
    const newEvent = this.eventsRepository.create({
      ...createEventDto,
      organizer_id: user.id,
    });

    return await this.eventsRepository.save(newEvent);
  }

  async update(id: string, updateEventDto: UpdateEventDto): Promise<Event> {
    const event = await this.eventsRepository.findOne({ where: { id } });

    if (!event) {
      throw new NotFoundException('Wydarzenie nie istnieje');
    }

    Object.assign(event, updateEventDto);

    return await this.eventsRepository.save(event);
  }

  async remove(id: string): Promise<void> {
    const event = await this.eventsRepository.findOne({ where: { id } });

    if (!event) {
      throw new NotFoundException('Wydarzenie nie istnieje');
    }

    await this.registrationsRepository.delete({ event_id: id });
    await this.ratingsRepository.delete({ event_id: id });
    await this.eventsRepository.delete(id);
  }

  async register(
    eventId: string,
    userId: string,
  ): Promise<{ participant_count: number; is_registered: boolean }> {
    const event = await this.eventsRepository.findOne({
      where: { id: eventId },
    });

    if (!event) {
      throw new NotFoundException('Wydarzenie nie istnieje');
    }

    const alreadyRegistered = await this.registrationsRepository.exists({
      where: { event_id: eventId, user_id: userId },
    });

    if (alreadyRegistered) {
      throw new ConflictException('Jesteś już zapisany na to wydarzenie');
    }

    const participantCount = await this.registrationsRepository.count({
      where: { event_id: eventId },
    });

    if (
      event.participant_limit !== null &&
      participantCount >= event.participant_limit
    ) {
      throw new ConflictException('Event is full');
    }

    const registration = this.registrationsRepository.create({
      event_id: eventId,
      user_id: userId,
    });

    await this.registrationsRepository.save(registration);

    return {
      participant_count: participantCount + 1,
      is_registered: true,
    };
  }

  async unregister(
    eventId: string,
    userId: string,
  ): Promise<{ participant_count: number; is_registered: boolean }> {
    const event = await this.eventsRepository.findOne({
      where: { id: eventId },
    });

    if (!event) {
      throw new NotFoundException('Wydarzenie nie istnieje');
    }

    const registration = await this.registrationsRepository.findOne({
      where: { event_id: eventId, user_id: userId },
    });

    if (!registration) {
      throw new NotFoundException('Nie jesteś zapisany na to wydarzenie');
    }

    await this.registrationsRepository.delete(registration.id);

    const participantCount = await this.registrationsRepository.count({
      where: { event_id: eventId },
    });

    return {
      participant_count: participantCount,
      is_registered: false,
    };
  }

  async rate(
    eventId: string,
    userId: string,
    rating: number,
  ): Promise<{
    user_rating: number;
    avg_rating: number;
    rating_count: number;
  }> {
    const event = await this.eventsRepository.findOne({
      where: { id: eventId },
    });

    if (!event) {
      throw new NotFoundException('Wydarzenie nie istnieje');
    }

    let ratingEntity = await this.ratingsRepository.findOne({
      where: { event_id: eventId, user_id: userId },
    });

    if (ratingEntity) {
      ratingEntity.rating = rating;
    } else {
      ratingEntity = this.ratingsRepository.create({
        event_id: eventId,
        user_id: userId,
        rating,
      });
    }

    await this.ratingsRepository.save(ratingEntity);

    const ratingResult = await this.ratingsRepository
      .createQueryBuilder('r')
      .select('AVG(r.rating)', 'avg')
      .addSelect('COUNT(r.id)', 'count')
      .where('r.event_id = :eventId', { eventId })
      .getRawOne<{ avg: string | null; count: string | null }>();

    const avg = ratingResult?.avg ? parseFloat(ratingResult.avg) : 0;
    const count = ratingResult?.count ? parseInt(ratingResult.count, 10) : 0;

    return {
      user_rating: rating,
      avg_rating: avg,
      rating_count: count,
    };
  }

  async unrate(
    eventId: string,
    userId: string,
  ): Promise<{
    user_rating: null;
    avg_rating: number | null;
    rating_count: number;
  }> {
    const event = await this.eventsRepository.findOne({
      where: { id: eventId },
    });

    if (!event) {
      throw new NotFoundException('Wydarzenie nie istnieje');
    }

    const ratingEntity = await this.ratingsRepository.findOne({
      where: { event_id: eventId, user_id: userId },
    });

    if (!ratingEntity) {
      throw new NotFoundException('Nie oceniłeś jeszcze tego wydarzenia');
    }

    await this.ratingsRepository.delete(ratingEntity.id);

    const ratingResult = await this.ratingsRepository
      .createQueryBuilder('r')
      .select('AVG(r.rating)', 'avg')
      .addSelect('COUNT(r.id)', 'count')
      .where('r.event_id = :eventId', { eventId })
      .getRawOne<{ avg: string | null; count: string }>();

    const avgRating = ratingResult?.avg ? parseFloat(ratingResult.avg) : null;
    const ratingCount = ratingResult ? parseInt(ratingResult.count, 10) : 0;

    return {
      user_rating: null,
      avg_rating: avgRating,
      rating_count: ratingCount,
    };
  }

  async getParticipants(
    eventId: string,
    params: FindParticipantsParams,
  ): Promise<{
    event: {
      id: string;
      title: string;
      participant_limit: number | null;
      participant_count: number;
    };
    participants: {
      user_id: string;
      name: string;
      class: string | null;
      email: string;
      registered_at: Date;
    }[];
  }> {
    const event = await this.eventsRepository.findOne({
      where: { id: eventId },
    });

    if (!event) {
      throw new NotFoundException('Wydarzenie nie istnieje');
    }

    const qb = this.registrationsRepository
      .createQueryBuilder('reg')
      .innerJoinAndSelect('reg.user', 'user')
      .where('reg.event_id = :eventId', { eventId });

    if (params.search) {
      qb.andWhere(
        '(LOWER(user.firstName) LIKE LOWER(:search) OR LOWER(user.lastName) LIKE LOWER(:search))',
        { search: `%${params.search}%` },
      );
    }

    const sort = params.sort ?? ParticipantSort.NAME_ASC;
    switch (sort) {
      case ParticipantSort.NAME_ASC:
        qb.orderBy('user.firstName', 'ASC').addOrderBy('user.lastName', 'ASC');
        break;
      case ParticipantSort.NAME_DESC:
        qb.orderBy('user.firstName', 'DESC').addOrderBy(
          'user.lastName',
          'DESC',
        );
        break;
      case ParticipantSort.DATE_ASC:
        qb.orderBy('reg.registered_at', 'ASC');
        break;
      case ParticipantSort.DATE_DESC:
        qb.orderBy('reg.registered_at', 'DESC');
        break;
    }

    const registrations = await qb.getMany();

    const participantCount = await this.registrationsRepository.count({
      where: { event_id: eventId },
    });

    const participants = registrations.map((reg) => ({
      user_id: reg.user.id,
      name: reg.user.fullName,
      class: reg.user.class,
      email: reg.user.email,
      registered_at: reg.registered_at,
    }));

    return {
      event: {
        id: event.id,
        title: event.title,
        participant_limit: event.participant_limit,
        participant_count: participantCount,
      },
      participants,
    };
  }

  async removeParticipant(
    eventId: string,
    userId: string,
  ): Promise<{ participant_count: number }> {
    const event = await this.eventsRepository.findOne({
      where: { id: eventId },
    });

    if (!event) {
      throw new NotFoundException('Wydarzenie nie istnieje');
    }

    const registration = await this.registrationsRepository.findOne({
      where: { event_id: eventId, user_id: userId },
    });

    if (!registration) {
      throw new NotFoundException(
        'Uczestnik nie jest zapisany na to wydarzenie',
      );
    }

    await this.registrationsRepository.delete(registration.id);

    const participantCount = await this.registrationsRepository.count({
      where: { event_id: eventId },
    });

    return { participant_count: participantCount };
  }

  async getStats(): Promise<{
    total_events: number;
    total_registrations: number;
    upcoming_7_days: number;
    avg_rating: number | null;
    recent_events: { id: string; title: string; type: string; date: string }[];
    most_popular: {
      id: string;
      title: string;
      participant_count: number;
    }[];
  }> {
    const total_events = await this.eventsRepository.count();
    const total_registrations = await this.registrationsRepository.count();

    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const in7Days = new Date(today);
    in7Days.setDate(today.getDate() + 7);

    const todayStr = today.toISOString().split('T')[0];
    const in7DaysStr = in7Days.toISOString().split('T')[0];

    const upcoming_7_days = await this.eventsRepository.count({
      where: { date: Between(todayStr, in7DaysStr) },
    });

    const ratingResult = await this.ratingsRepository
      .createQueryBuilder('r')
      .select('AVG(r.rating)', 'avg')
      .getRawOne<{ avg: string | null }>();

    const avg_rating = ratingResult?.avg ? parseFloat(ratingResult.avg) : null;

    const recent_events = await this.eventsRepository.find({
      order: { created_at: 'DESC' },
      take: 5,
      select: ['id', 'title', 'type', 'date'],
    });

    const most_popular_raw = await this.eventsRepository
      .createQueryBuilder('e')
      .leftJoin('e.registrations', 'reg')
      .select('e.id', 'id')
      .addSelect('e.title', 'title')
      .addSelect('COUNT(reg.id)', 'participant_count')
      .groupBy('e.id')
      .orderBy('participant_count', 'DESC')
      .limit(5)
      .getRawMany<{ id: string; title: string; participant_count: string }>();

    const most_popular = most_popular_raw.map((row) => ({
      id: row.id,
      title: row.title,
      participant_count: parseInt(row.participant_count, 10),
    }));

    return {
      total_events,
      total_registrations,
      upcoming_7_days,
      avg_rating,
      recent_events: recent_events.map((e) => ({
        id: e.id,
        title: e.title,
        type: e.type,
        date: e.date,
      })),
      most_popular,
    };
  }
}
