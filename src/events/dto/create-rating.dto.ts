import { IsInt, Max, Min } from 'class-validator';

export class CreateRatingDto {
  @IsInt({ message: 'Ocena musi być liczbą całkowitą' })
  @Min(1, { message: 'Ocena musi wynosić co najmniej 1' })
  @Max(5, { message: 'Ocena może wynosić maksymalnie 5' })
  rating: number;
}
