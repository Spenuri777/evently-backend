import { SetMetadata } from '@nestjs/common';
import { Role } from 'src/user/role.enum';

export const EVENT_ROLES_KEY = 'event_roles';
export const EventRoles = (...roles: Role[]) =>
  SetMetadata(EVENT_ROLES_KEY, roles);
