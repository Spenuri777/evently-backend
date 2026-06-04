import { User } from 'src/user/entities/user.entity';
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  ManyToOne,
  JoinColumn,
  Unique,
  Check,
} from 'typeorm';
import { Event } from './event.entity';

@Entity('ratings')
@Unique(['event_id', 'user_id'])
@Check(`"rating" >= 1 AND "rating" <= 5`)
export class Rating {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  event_id: string;

  @Column()
  user_id: string;

  @Column({ type: 'int' })
  rating: number;

  @ManyToOne(() => Event, (event) => event.ratings)
  @JoinColumn({ name: 'event_id' })
  event: Event;

  @ManyToOne(() => User, (user) => user.ratings)
  @JoinColumn({ name: 'user_id' })
  user: User;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;
}
