create table projects (
  id uuid default gen_random_uuid() primary key,
  -- 제품 이름
  name text,
  -- 상세 정보
  description text,
  -- 카테고리
  category text,
  -- 상태
  status text,
  -- 모집 시작일자
  start_date timestamp with time zone,
  -- 모집 종료일자
  end_date timestamp with time zone,
  -- 투자금액
  invest_amounts integer default 0,
  -- 최소투자금액
  min_invest_amounts integer default 0,
  -- 최대투자금액
  max_invest_amounts integer default 0,
  -- 투자타입
  invest_detail_type text,
  -- 상환방법
  repayment_method text,
  -- 완료일자
  assignment_completion_date timestamp with time zone,
  -- 대표이미지
  thumbnail text,
  -- 이미지
  images text [],
  -- 심사 승인일자
  acceped_at timestamp with time zone,
  -- 심사 거절일자
  rejected_at timestamp with time zone,
  -- 심사 거절 이유
  rejected_reason text,
  -- 신청 결과
  application_result json,
  user_id uuid references users(id) not null,
  company_id uuid references companies(id) not null,

  created_at timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp with time zone
);

comment on column projects.name is '제품 이름';

comment on column projects.description is '상세 정보';

comment on column projects.category is '카테고리';

comment on column projects.status is '상태';

comment on column projects.start_date is '모집 시작일자';

comment on column projects.end_date is '모집 종료일자';

comment on column projects.invest_amounts is '투자금액';

comment on column projects.min_invest_amounts is '최소투자금액';

comment on column projects.max_invest_amounts is '최대투자금액';

comment on column projects.invest_detail_type is '투자타입';

comment on column projects.repayment_method is '상환방법';

-- comment on column projects.assignment_completion_date is '';
comment on column projects.thumbnail is '대표이미지';

comment on column projects.images is '이미지';

comment on column projects.acceped_at is '심사 승인일자';

comment on column projects.rejected_at is '심사 거절일자';

comment on column projects.rejected_reason is '심사 거절 이유';

comment on column projects.user_id is '창작자';

comment on column projects.company_id is '회사';

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table
  projects enable row level security;

create policy "Public projects are viewable by everyone." on projects for
select
  using (true);

create policy "Users can insert their own project." on projects for
insert
  with check (auth.uid() = user_id);

create policy "Users can update own project." on projects for
update
  using (auth.uid() = user_id);

-- Set up Storage!
insert into
  storage.buckets (id, name)
values
  ('project_images', 'project_images');

-- Set up access controls for storage.
-- See https://supabase.com/docs/guides/storage#policy-examples for more details.
create policy "Project images are publicly accessible." on storage.objects for
select
  using (bucket_id = 'project_images');

create policy "Anyone can upload an project image." on storage.objects for
insert
  with check (bucket_id = 'project_images');