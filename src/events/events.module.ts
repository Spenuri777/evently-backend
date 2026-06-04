import { Module } from '@nestjs/common';
import { EventsService } from './events.service';
import { EventsController } from './events.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Rating } from './entities/rating.entity';
import { Registration } from './entities/registration.entity';
import { User } from 'src/user/entities/user.entity';
import { Event } from './entities/event.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Event, Registration, Rating, User])],
  controllers: [EventsController],
  providers: [EventsService],
  exports: [EventsService],
})
export class EventsModule {}
