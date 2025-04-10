create table public.services (
  id uuid not null default extensions.uuid_generate_v4 (),
  name text not null,
  price numeric(10, 2) not null,
  duration integer not null,
  is_available boolean null default true,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  updated_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint services_pkey primary key (id)
) TABLESPACE pg_default;

create trigger update_services_updated_at BEFORE
update on services for EACH row
execute FUNCTION update_updated_at_column ();