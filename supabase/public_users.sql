create table public.users (
  id uuid not null,
  email text not null,
  role text not null,
  name text null,
  phone text null,
  created_at timestamp with time zone not null default timezone ('utc'::text, now()),
  updated_at timestamp with time zone not null default timezone ('utc'::text, now()),
  constraint users_pkey primary key (id),
  constraint users_email_key unique (email),
  constraint users_id_fkey foreign KEY (id) references auth.users (id),
  constraint users_role_check check (
    (role = any (array['client'::text, 'admin'::text]))
  )
) TABLESPACE pg_default;