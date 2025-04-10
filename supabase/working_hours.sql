create table public.working_hours (
  day_of_week smallint not null,
  start_time time without time zone not null,
  end_time time without time zone not null,
  is_working_day boolean null default true,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  updated_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint working_hours_pkey primary key (day_of_week),
  constraint working_hours_day_of_week_check check (
    (
      (day_of_week >= 0)
      and (day_of_week <= 6)
    )
  )
) TABLESPACE pg_default;

create trigger update_working_hours_updated_at BEFORE
update on working_hours for EACH row
execute FUNCTION update_updated_at_column ();