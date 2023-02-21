create table faqs (
  id uuid default gen_random_uuid() primary key,
  project_id uuid references projects(id),
  user_id uuid references users(id) not null,
  -- FAQ 질문
  question text,
  -- FAQ 답변
  answer text,

  created_at timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp with time zone
);

comment on column faqs.project_id is '프로젝트';

comment on column faqs.user_id is '생성자';

comment on column faqs.question is 'FAQ 질문';

comment on column faqs.answer is 'FAQ 답변';

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table
  faqs enable row level security;

create policy "Public faqs are viewable by everyone." on faqs for
select
  using (true);

create policy "Users can insert their own faq." on faqs for
insert
  with check (auth.uid() = user_id);

create policy "Users can update own faq." on faqs for
update
  using (auth.uid() = user_id);
