import { IsString, MaxLength } from 'class-validator';

export class UpdateUserDto {
  @IsString({ message: 'First name must be a string' })
  @MaxLength(50, { message: 'First name must be less than 50 characters long' })
  firstName: string;

  @IsString({ message: 'Last name must be a string' })
  @MaxLength(50, { message: 'Last name must be less than 50 characters long' })
  lastName: string;
}
