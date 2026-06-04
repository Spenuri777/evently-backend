import { Exclude, Expose, Type } from 'class-transformer';
import { Role } from 'src/user/role.enum';

@Exclude()
export class UserResponseDto {
  @Expose()
  id: string;

  @Expose()
  email: string;

  @Expose()
  firstName: string;

  @Expose()
  lastName: string;

  @Expose()
  createdAt: Date;

  @Expose()
  class: string;

  @Expose()
  isActive: boolean;

  @Expose()
  role: Role;

  constructor(partial: Partial<UserResponseDto>) {
    Object.assign(this, partial);
  }
}

export class AuthResponseDto {
  @Expose()
  @Type(() => UserResponseDto)
  user: UserResponseDto;

  @Expose()
  accessToken: string;

  constructor(user: UserResponseDto, accessToken: string) {
    this.user = user;
    this.accessToken = accessToken;
  }
}
