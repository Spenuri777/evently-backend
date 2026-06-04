import {
  IsEnum,
  IsNotEmpty,
  IsOptional,
  IsString,
  IsInt,
  Min,
  IsDateString,
  Matches,
} from 'class-validator';
import { EventType } from '../entities/event.entity';
export class CreateEventDto {
  @IsString({ message: 'Tytuł musi być tekstem' })
  @IsNotEmpty({ message: 'Tytuł wydarzenia nie może być pusty' })
  title: string;

  @IsString({ message: 'Opis musi być tekstem' })
  @IsNotEmpty({ message: 'Opis wydarzenia nie może być pusty' })
  description: string;

  @IsEnum(EventType, {
    message:
      'Typ wydarzenia musi być jednym z: konkurs, wycieczka, zebranie, sportowy, kulturalny',
  })
  type: EventType;

  @IsDateString(
    {},
    { message: 'Data musi być poprawnym formatem daty (np. 2026-05-17)' },
  )
  @IsNotEmpty({ message: 'Data jest wymagana' })
  date: string;

  @IsOptional()
  @IsString({ message: 'Format czasu musi być tekstem' })
  @Matches(/^([01]\d|2[0-3]):([0-5]\d)(:([0-5]\d))?$/, {
    message:
      'Czas musi być podany w poprawnym formacie HH:MM lub HH:MM:SS (np. 08:00)',
  })
  time?: string;

  @IsOptional()
  @IsString({ message: 'Lokalizacja musi być tekstem' })
  location?: string;

  @IsOptional()
  @IsInt({ message: 'Limit uczestników musi być liczbą całkowitą' })
  @Min(1, { message: 'Limit uczestników musi wynosić co najmniej 1 osobę' })
  participant_limit?: number;
}
