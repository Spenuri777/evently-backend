import { IsEmail, IsNotEmpty } from 'class-validator';

export class EmailParam {
  @IsNotEmpty()
  @IsEmail()
  email: string;
}
