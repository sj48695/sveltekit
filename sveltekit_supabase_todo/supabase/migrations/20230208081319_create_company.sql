create table companies (
  id uuid default gen_random_uuid() primary key,
  -- 회사명
  name text,

  created_at timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp with time zone
);

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table
  companies enable row level security;

create policy "Public companies are viewable by everyone." on companies for
select
  using (true);