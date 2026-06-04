import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserModule } from './user/user.module';
import { User } from './user/entities/user.entity';
import { AuthModule } from './auth/auth.module';
import { EventsModule } from './events/events.module';
import { AdminModule } from './admin/admin.module';
import { Event } from './events/entities/event.entity';
import { Registration } from './events/entities/registration.entity';
import { Rating } from './events/entities/rating.entity';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: 'root',
      password: '',
      database: 'evently',
      entities: [User, Event, Registration, Rating],
      synchronize: true,
    }),
    UserModule,
    AuthModule,
    EventsModule,
    AdminModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
