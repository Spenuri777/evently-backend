import { IsEnum, IsOptional, IsString } from 'class-validator';

export enum ParticipantSort {
  NAME_ASC = 'name_asc',
  NAME_DESC = 'name_desc',
  DATE_ASC = 'date_asc',
  DATE_DESC = 'date_desc',
}

export class FindParticipantsParams {
  @IsOptional()
  @IsString()
  search?: string;

  @IsOptional()
  @IsEnum(ParticipantSort)
  sort?: ParticipantSort = ParticipantSort.NAME_ASC;
}
