create table project_managers (
  company_id uuid references companies(id) not null,
  user_id uuid references users(id) not null,
  role text,

  created_at timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp with time zone,

  CONSTRAINT "project_managers_pkey" PRIMARY KEY ("company_id","user_id")
);

comment on column project_managers.company_id is '회사';

comment on column project_managers.user_id is '창작자';

comment on column project_managers.role is 'owner/read-only/...';

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table
  project_managers enable row level security;

create policy "Public project_managers are viewable by everyone." on project_managers for
select
  using (true);

create policy "Users can insert their own project_manager." on project_managers for
insert
  with check (auth.uid() = user_id);

create policy "Users can update own project_manager." on project_managers for
update
  using (auth.uid() = user_id);