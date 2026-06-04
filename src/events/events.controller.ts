import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  Post,
  Put,
  Query,
  UseGuards,
} from '@nestjs/common';
import { EventsService } from './events.service';
import { FindEventsParams } from './find-events.params';
import { PaginationParams } from 'src/params/pagination.params';
import { PaginationResponse } from 'src/params/pagination.response';
import { Event } from './entities/event.entity';
import { FindOneParams } from 'src/params/find-one.params';
import { CreateEventDto } from './dto/create-event.dto';
import { UpdateEventDto } from './dto/update-event.dto';
import { CreateRatingDto } from './dto/create-rating.dto';
import { CurrentUser } from 'src/auth/decorator/current-user.decorator';
import { User } from 'src/user/entities/user.entity';
import { EventRoles } from './decorator/event-roles.decorator';
import { Role } from 'src/user/role.enum';
import { EventRoleGuard } from './guard/event-roles.guard';
import { JwtGuard } from 'src/auth/guard/jwt.guard';

@Controller('events')
export class EventsController {
  constructor(private readonly eventsService: EventsService) {}

  @Get()
  @EventRoles(Role.USER, Role.TEACHER, Role.ADMIN)
  @UseGuards(JwtGuard, EventRoleGuard)
  async findAll(
    @Query() filters: FindEventsParams,
    @Query() pagination: PaginationParams,
    @CurrentUser() user: User,
  ): Promise<PaginationResponse<Event>> {
    const [items, total] = await this.eventsService.findAll(
      filters,
      pagination,
      user.id,
    );

    return {
      data: items,
      meta: {
        total,
        ...pagination,
      },
    };
  }

  @Get(':id')
  @EventRoles(Role.USER, Role.TEACHER, Role.ADMIN)
  @UseGuards(JwtGuard, EventRoleGuard)
  async findOne(@Param() { id }: FindOneParams, @CurrentUser() user: User) {
    return await this.eventsService.findOneWithDetails(id, user.id);
  }

  @Post()
  @EventRoles(Role.ADMIN, Role.TEACHER)
  @UseGuards(JwtGuard, EventRoleGuard)
  async create(
    @Body() createEventDto: CreateEventDto,
    @CurrentUser() user: User,
  ): Promise<Event> {
    return await this.eventsService.create(createEventDto, user);
  }

  @Post(':id/register')
  @EventRoles(Role.USER, Role.TEACHER)
  @UseGuards(JwtGuard, EventRoleGuard)
  async register(
    @Param() { id }: FindOneParams,
    @CurrentUser() user: User,
  ): Promise<{ participant_count: number; is_registered: boolean }> {
    return await this.eventsService.register(id, user.id);
  }

  @Post(':id/rating')
  @EventRoles(Role.USER, Role.TEACHER)
  @UseGuards(JwtGuard, EventRoleGuard)
  async rate(
    @Param() { id }: FindOneParams,
    @Body() { rating }: CreateRatingDto,
    @CurrentUser() user: User,
  ): Promise<{
    user_rating: number;
    avg_rating: number;
    rating_count: number;
  }> {
    return await this.eventsService.rate(id, user.id, rating);
  }

  @Put(':id')
  @EventRoles(Role.ADMIN, Role.TEACHER)
  @UseGuards(JwtGuard, EventRoleGuard)
  async update(
    @Param() { id }: FindOneParams,
    @Body() updateEventDto: UpdateEventDto,
  ): Promise<Event> {
    return await this.eventsService.update(id, updateEventDto);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  @EventRoles(Role.ADMIN, Role.TEACHER)
  @UseGuards(JwtGuard, EventRoleGuard)
  async remove(@Param() { id }: FindOneParams): Promise<void> {
    return await this.eventsService.remove(id);
  }

  @Delete(':id/register')
  @EventRoles(Role.USER, Role.TEACHER)
  @UseGuards(JwtGuard, EventRoleGuard)
  async unregister(
    @Param() { id }: FindOneParams,
    @CurrentUser() user: User,
  ): Promise<{ participant_count: number; is_registered: boolean }> {
    return await this.eventsService.unregister(id, user.id);
  }

  @Delete(':id/rating')
  @EventRoles(Role.USER, Role.TEACHER)
  @UseGuards(JwtGuard, EventRoleGuard)
  async unrate(
    @Param() { id }: FindOneParams,
    @CurrentUser() user: User,
  ): Promise<{
    user_rating: null;
    avg_rating: number | null;
    rating_count: number;
  }> {
    return await this.eventsService.unrate(id, user.id);
  }
}
