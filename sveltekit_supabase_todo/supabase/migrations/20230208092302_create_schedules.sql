create table schedules (
  id uuid default gen_random_uuid() primary key,
  project_id uuid references projects(id) not null,
  user_id uuid references users(id) not null,
  -- 일정 이름
  title text,
  -- 설명
  description text,
  -- 일정 일시
  date timestamp with time zone,

  created_at timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp with time zone
);

comment on column schedules.project_id is '프로젝트';

comment on column schedules.user_id is '생성자';

comment on column schedules.title is '일정 이름';

comment on column schedules.description is '설명';

comment on column schedules.date is '일정 일시';

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table
  schedules enable row level security;

create policy "Public schedules are viewable by everyone." on schedules for
select
  using (true);

create policy "Users can insert their own schedule." on schedules for
insert
  with check (auth.uid() = user_id);

create policy "Users can update own schedule." on schedules for
update
  using (auth.uid() = user_id);