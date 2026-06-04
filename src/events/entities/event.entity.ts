import { User } from 'src/user/entities/user.entity';
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  ManyToOne,
  OneToMany,
  JoinColumn,
} from 'typeorm';
import { Registration } from './registration.entity';
import { Rating } from './rating.entity';

export enum EventType {
  KONKURS = 'konkurs',
  WYCIECZKA = 'wycieczka',
  ZEBRANIE = 'zebranie',
  SPORTOWY = 'sportowy',
  KULTURALNY = 'kulturalny',
}

@Entity('events')
export class Event {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  title: string;

  @Column({ type: 'text' })
  description: string;

  @Column({ type: 'enum', enum: EventType })
  type: EventType;

  @Column({ type: 'date' })
  date: string;

  @Column({ type: 'time', nullable: true })
  time: string;

  @Column({ nullable: true })
  location: string;

  @Column({ nullable: true })
  participant_limit: number;

  @Column()
  organizer_id: string;

  @ManyToOne(() => User, (user) => user.organized_events)
  @JoinColumn({ name: 'organizer_id' })
  organizer: User;

  @OneToMany(() => Registration, (registration) => registration.event)
  registrations: Registration[];

  @OneToMany(() => Rating, (rating) => rating.event)
  ratings: Rating[];

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  is_registered?: boolean;
}
