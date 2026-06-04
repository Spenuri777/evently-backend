import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './entities/user.entity';
import { RegisterDto } from 'src/auth/dto/register.dto';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {}

  async findAll(): Promise<User[]> {
    return this.userRepository.find({
      where: { isActive: true },
    });
  }

  async findById(id: string): Promise<User> {
    const user = await this.userRepository.findOne({
      where: { id, isActive: true },
    });

    if (!user) {
      throw new NotFoundException('User not found');
    }

    return user;
  }

  async findByEmail(email: string): Promise<User | null> {
    return this.userRepository.findOne({ where: { email, isActive: true } });
  }

  async create(registerDto: RegisterDto): Promise<User> {
    const existingEmail = await this.findByEmail(registerDto.email);

    if (existingEmail) throw new ConflictException('Email already exists');

    const newUser = this.userRepository.create({
      ...registerDto,
      passwordHash: registerDto.password,
    });

    return this.userRepository.save(newUser);
  }

  async update(id: string, newUserData: Partial<User>): Promise<User> {
    const user = await this.findById(id);

    delete newUserData.email;
    delete newUserData.passwordHash;
    Object.assign(user, newUserData);

    return this.userRepository.save(user);
  }

  async deactivate(id: string): Promise<User> {
    const user = await this.findById(id);
    user.isActive = false;
    return this.userRepository.save(user);
  }

  async validateUser(email: string, password: string): Promise<User | null> {
    const user = await this.userRepository.findOne({
      where: { email, isActive: true },
    });

    if (user && (await user.validatePassword(password))) {
      return user;
    }

    return null;
  }
}
