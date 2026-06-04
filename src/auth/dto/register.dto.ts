import {
  IsEmail,
  IsNotEmpty,
  IsString,
  MaxLength,
  MinLength,
} from 'class-validator';

export class RegisterDto {
  @IsEmail({}, { message: 'Please provide a valid email address' })
  @IsNotEmpty({ message: 'Email is required' })
  email: string;

  @IsString({ message: 'Password must be a string' })
  @IsNotEmpty({ message: 'Password is required' })
  @MinLength(8, { message: 'Password must be at least 8 characters long' })
  @MaxLength(50, { message: 'Password must be less than 50 characters long' })
  password: string;

  @IsString({ message: 'First name must be a string' })
  @MaxLength(50, { message: 'First name must be less than 50 characters long' })
  firstName: string;

  @IsString({ message: 'Last name must be a string' })
  @MaxLength(50, { message: 'Last name must be less than 50 characters long' })
  lastName: string;

  @IsString({ message: 'Class must be a string' })
  @MaxLength(2, { message: 'Class must be less than 2 characters long' })
  class: string;
}
