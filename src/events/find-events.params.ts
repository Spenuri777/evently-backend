import {
  IsBoolean,
  IsDateString,
  IsEnum,
  IsOptional,
  IsString,
} from 'class-validator';
import { EventType } from './entities/event.entity';
import { Transform } from 'class-transformer';

export class FindEventsParams {
  @IsOptional()
  @IsString({ message: 'Wyszukiwana fraza musi być tekstem' })
  search?: string;

  @IsOptional()
  @IsEnum(EventType, {
    message:
      'Kategoria musi przyjmować jedną wartość z: konkurs, wycieczka, zebranie, sportowy, kulturalny',
  })
  type?: EventType;

  @IsOptional()
  @IsDateString(
    {},
    {
      message: 'Data (od) musi być poprawną datą (np. 2026-05-17)',
    },
  )
  dateFrom?: string;

  @IsOptional()
  @IsDateString(
    {},
    {
      message: 'Data (do) musi być poprawną datą (np. 2026-05-20)',
    },
  )
  dateTo?: string;

  @IsOptional()
  @Transform(({ value }) => {
    if (value === 'true' || value === true) return true;
    if (value === 'false' || value === false) return false;
    return undefined;
  })
  @IsBoolean({
    message: 'myRegistrations musi być wartością logiczną (true/false)',
  })
  myRegistrations?: boolean;
}
