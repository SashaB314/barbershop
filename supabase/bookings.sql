create table public.bookings (
  id uuid not null default extensions.uuid_generate_v4 (),
  name text not null,
  phone text not null,
  service text not null,
  date date not null,
  time time without time zone not null,
  created_at timestamp with time zone not null default timezone ('utc'::text, now()),
  user_id uuid not null,
  constraint bookings_pkey primary key (id),
  constraint bookings_user_id_fkey foreign KEY (user_id) references users (id)
) TABLESPACE pg_default;