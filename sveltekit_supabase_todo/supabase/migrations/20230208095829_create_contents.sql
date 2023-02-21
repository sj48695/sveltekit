create table contents (
  id uuid default gen_random_uuid() primary key,
  project_id uuid references projects(id),
  user_id uuid references users(id) not null,
  -- 콘텐츠 제목
  title text,
  -- 콘텐츠 부제목
  sub_title text,
  -- 설명
  description text,
  -- 순서
  "order" integer default 0,
  -- 타입 (Media / InvestPoints / InvestWarnnings / Reword / ...)
  type text,
  -- 링크 URL
  link_url text,
  -- 대표이미지 URL
  thumbnail text,
  -- 이미지 URL 리스트
  images text [],

  created_at timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp with time zone
);

comment on column contents.project_id is '프로젝트';

comment on column contents.user_id is '생성자';

comment on column contents.title is '콘텐츠 제목';

comment on column contents.sub_title is '콘텐츠 부제목';

comment on column contents.description is '설명';

comment on column contents.order is '순서';

comment on column contents.type is '타입 (MIdia / InvestPoints / InvestWarnnings / Reword / ...)';

comment on column contents.link_url is '링크 URL';

comment on column contents.thumbnail is '대표이미지 URL';

comment on column contents.images is '이미지 URL 리스트';

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table
  contents enable row level security;

create policy "Public contents are viewable by everyone." on contents for
select
  using (true);

create policy "Users can insert their own content." on contents for
insert
  with check (auth.uid() = user_id);

create policy "Users can update own content." on contents for
update
  using (auth.uid() = user_id);

-- Set up Storage!
insert into
  storage.buckets (id, name)
values
  ('content_images', 'content_images');

-- Set up access controls for storage.
-- See https://supabase.com/docs/guides/storage#policy-examples for more details.
create policy "Content images are publicly accessible." on storage.objects for
select
  using (bucket_id = 'content_images');

create policy "Anyone can upload an content image." on storage.objects for
insert
  with check (bucket_id = 'content_images');