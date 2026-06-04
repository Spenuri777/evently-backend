import {
  ConflictException,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UserService } from 'src/user/user.service';
import { RegisterDto } from './dto/register.dto';
import { AuthResponseDto, UserResponseDto } from './dto/auth-response.dto';
import { LoginDto } from './dto/login.dto';
import { User } from 'src/user/entities/user.entity';

@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UserService,
    private readonly jwtService: JwtService,
  ) {}

  async register(registerDto: RegisterDto): Promise<AuthResponseDto> {
    try {
      const user = await this.userService.create(registerDto);

      const payload = { sub: user.id, email: user.email };
      const accessToken = this.jwtService.sign(payload);

      const userResponse = new UserResponseDto(user);
      return new AuthResponseDto(userResponse, accessToken);
    } catch (error) {
      if (error instanceof ConflictException) throw error;
      console.log(error);
      throw new ConflictException('Registeration failed');
    }
  }

  async login(loginDto: LoginDto): Promise<AuthResponseDto> {
    const user = await this.userService.validateUser(
      loginDto.email,
      loginDto.password,
    );

    if (!user) throw new UnauthorizedException('Invalid email or password');

    const payload = { sub: user.id, email: user.email };
    const accessToken = this.jwtService.sign(payload);

    const userResponse = new UserResponseDto(user);
    return new AuthResponseDto(userResponse, accessToken);
  }

  async validateUserById(userId: string): Promise<User | null> {
    try {
      return await this.userService.findById(userId);
    } catch (error) {
      return null;
    }
  }
}
