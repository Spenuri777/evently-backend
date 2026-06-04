import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';
import { UserResponseDto } from 'src/auth/dto/auth-response.dto';
import { RegisterDto } from 'src/auth/dto/register.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { UserService } from './user.service';
import { FindOneParams } from 'src/params/find-one.params';

@Controller('users')
export class UserController {
  constructor(private readonly userService: UserService) {}

  // [GET] Methods
  @Get()
  async findAll(): Promise<UserResponseDto[]> {
    const users = await this.userService.findAll();
    return users.map((user) => new UserResponseDto(user));
  }

  @Get('/:id')
  async findById(@Param() { id }: FindOneParams): Promise<UserResponseDto> {
    const user = await this.userService.findById(id);
    return new UserResponseDto(user);
  }

  // [POST] Method
  @Post()
  async createUser(@Body() registerDto: RegisterDto): Promise<UserResponseDto> {
    const user = await this.userService.create(registerDto);
    return new UserResponseDto(user);
  }

  // [PATCH] Method
  @Patch('/:id')
  async update(
    @Param() { id }: FindOneParams,
    @Body() updateUserDto: UpdateUserDto,
  ): Promise<UserResponseDto> {
    const user = await this.userService.update(id, updateUserDto);
    return new UserResponseDto(user);
  }

  // [DELETE] Method
  @Delete('/:id')
  async deactivate(@Param() { id }: FindOneParams): Promise<UserResponseDto> {
    const user = await this.userService.deactivate(id);
    return new UserResponseDto(user);
  }
}
