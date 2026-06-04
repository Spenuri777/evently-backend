import {
  Controller,
  Delete,
  Get,
  Param,
  Query,
  UseGuards,
} from '@nestjs/common';
import { EventsService } from 'src/events/events.service';
import { FindOneParams } from 'src/params/find-one.params';
import { FindParticipantsParams } from 'src/events/dto/find-participants.params';
import { EventRoles } from 'src/events/decorator/event-roles.decorator';
import { EventRoleGuard } from 'src/events/guard/event-roles.guard';
import { JwtGuard } from 'src/auth/guard/jwt.guard';
import { Role } from 'src/user/role.enum';

@Controller('admin')
@EventRoles(Role.ADMIN, Role.TEACHER)
@UseGuards(JwtGuard, EventRoleGuard)
export class AdminController {
  constructor(private readonly eventsService: EventsService) {}

  @Get('events/:id/participants')
  async getParticipants(
    @Param() { id }: FindOneParams,
    @Query() params: FindParticipantsParams,
  ) {
    return await this.eventsService.getParticipants(id, params);
  }

  @Delete('events/:id/participants/:userId')
  async removeParticipant(
    @Param('id') id: string,
    @Param('userId') userId: string,
  ): Promise<{ participant_count: number }> {
    return await this.eventsService.removeParticipant(id, userId);
  }

  @Get('stats')
  async getStats() {
    return await this.eventsService.getStats();
  }
}
