import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  CreateDateColumn,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Role } from '../role.enum';
import { Exclude } from 'class-transformer';
import bcrypt from 'node_modules/bcryptjs';
import { Registration } from 'src/events/entities/registration.entity';
import { Event } from 'src/events/entities/event.entity';
import { Rating } from 'src/events/entities/rating.entity';

@Entity('users')
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ unique: true })
  email: string;

  @Column()
  @Exclude()
  passwordHash: string;

  @Column({ type: 'varchar', length: 100 })
  firstName: string;

  @Column({ type: 'varchar', length: 100 })
  lastName: string;

  @CreateDateColumn()
  createdAt: Date;

  @Column({ type: 'enum', enum: Role, default: Role.USER })
  role: Role;

  @Column({ type: 'varchar', length: 2, nullable: true })
  class: string;

  @Column({ default: true })
  isActive: boolean;

  @OneToMany(() => Event, (event) => event.organizer)
  organized_events: Event[];

  @OneToMany(() => Registration, (registration) => registration.user)
  registrations: Registration[];

  @OneToMany(() => Rating, (rating) => rating.user)
  ratings: Rating[];

  @BeforeInsert()
  @BeforeUpdate()
  async hashPassword() {
    if (this.passwordHash) {
      const salt = await bcrypt.genSalt(12);
      this.passwordHash = await bcrypt.hash(this.passwordHash, salt);
    }
  }

  async validatePassword(password: string): Promise<boolean> {
    return bcrypt.compare(password, this.passwordHash);
  }

  get fullName() {
    return `${this.firstName || ''} ${this.lastName || ''}`.trim();
  }
}
