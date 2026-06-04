import { User } from 'src/user/entities/user.entity';
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
  Unique,
} from 'typeorm';
import { Event } from './event.entity';

@Entity('registrations')
@Unique(['event_id', 'user_id'])
export class Registration {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  event_id: string;

  @Column()
  user_id: string;

  @ManyToOne(() => Event, (event) => event.registrations)
  @JoinColumn({ name: 'event_id' })
  event: Event;

  @ManyToOne(() => User, (user) => user.registrations)
  @JoinColumn({ name: 'user_id' })
  user: User;

  @CreateDateColumn()
  registered_at: Date;
}
