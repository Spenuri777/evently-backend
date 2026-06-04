# Evently - Backend API

Backend database and API server for **Evently** a school event management platform designed to help students, teachers, and administrators easily coordinate school events, field trips, contests, sports, and cultural activities.

Built on the **NestJS** framework and powered by **TypeORM** and **MySQL**, this backend serves as the foundation for the Evently application, handling user accounts, event creation, registration logic, ratings, and statistics.

---

## ✨ Key Features

- **Secure Authentication & Roles**
  - Sign up, log in, and secure profile management.
  - Three distinct user roles: **Students/Users**, **Teachers**, and **Administrators**.

- **Event Management**
  - Create, view, edit, and delete events.
  - Multiple event categories.
  - Participant limits to prevent overbooking.

- **Participant Registration & Ratings**
  - Users can join or leave events with a single click.
  - Users can rate past events and view average feedback ratings.

- **Admin & Teacher Dashboards**
  - View event participant rosters.
  - Remove participants if needed.
  - View overall platform stats (total events, registrations, etc.).

---

## 🛠️ Built With

- **[NestJS](https://nestjs.com/)** - A progressive Node.js framework for building efficient, reliable, and scalable server-side applications.
- **[TypeORM](https://typeorm.io/)** - Object-Relational Mapper for TypeScript, mapping database tables to JavaScript/TypeScript objects.
- **[MySQL](https://www.mysql.com/)** - Relational database for storing user accounts, events, registrations, and ratings.
- **TypeScript** - For type safety and cleaner, more maintainable code.
- **Passport.js & JWT** - Securing endpoints and managing sessions.

---

## 📡 API Reference Overview

Here are some of the main endpoints provided by this service:

### Auth & Profile (`/auth`)

- `POST /auth/register` - Create a new user account.
- `POST /auth/login` - Authenticate and retrieve a JWT access token.
- `GET /auth/profile` - Retrieve the current authenticated user's details.

### Events (`/events`)

- `GET /events` - List all events (supports pagination and filtering by type).
- `GET /events/:id` - Get details of a specific event.
- `POST /events` - Create a new event _(Teacher/Admin only)_.
- `PUT /events/:id` - Update event details _(Teacher/Admin only)_.
- `DELETE /events/:id` - Delete an event _(Teacher/Admin only)_.
- `POST /events/:id/register` - Register the current user for an event.
- `DELETE /events/:id/register` - Cancel registration for an event.
- `POST /events/:id/rating` - Rate an event (1-5 scale).

### Admin Dashboard (`/admin`)

- `GET /admin/events/:id/participants` - List participants registered for a specific event _(Teacher/Admin only)_.
- `DELETE /admin/events/:id/participants/:userId` - Remove a participant from an event _(Teacher/Admin only)_.
- `GET /admin/stats` - Retrieve aggregate portal stats _(Teacher/Admin only)_.
