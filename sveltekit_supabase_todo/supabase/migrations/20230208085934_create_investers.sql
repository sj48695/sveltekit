create table investors (
  id uuid default gen_random_uuid() primary key,
  project_id uuid references projects(id) not null,
  user_id uuid references users(id) not null,
  status text,
  acceped_at timestamp with time zone,

  created_at timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp with time zone
);

comment on column investors.project_id is '프로젝트';

comment on column investors.user_id is '투자자';

comment on column investors.status is '배정상태';

comment on column investors.acceped_at is '배정일시';

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table
  investors enable row level security;

create policy "Public investors are viewable by everyone." on investors for
select
  using (true);

create policy "Users can insert their own investor." on investors for
insert
  with check (auth.uid() = user_id);

create policy "Users can update own investor." on investors for
update
  using (auth.uid() = user_id);