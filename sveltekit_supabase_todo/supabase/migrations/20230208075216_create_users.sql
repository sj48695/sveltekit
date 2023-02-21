create table users (
  id uuid default gen_random_uuid() primary key,
  username text unique,
  full_name text,
  -- 이미지 경로
  avatar_url text,
  -- 전화번호
  phone_number text,
  -- 이메일
  email text,
  -- 생년월일
  birthday date,
  -- 투자자 등급(일반투자자/적격투자자/전문투자자)
  role text,

  created_at timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp with time zone,

  constraint username_length check (char_length(username) >= 3)
);

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table
  users enable row level security;

create policy "Public users are viewable by everyone." on users for
select
  using (true);

create policy "Users can insert their own profile." on users for
insert
  with check (auth.uid() = id);

create policy "Users can update own profile." on users for
update
  using (auth.uid() = id);

-- This trigger automatically creates a profile entry when a new user signs up via Supabase Auth.
-- See https://supabase.com/docs/guides/auth/managing-user-data#using-triggers for more details.
create function public.handle_new_user()
returns trigger as $$
begin
insert into
  public.users (id, full_name, avatar_url, email)
values
  (
    new.id,
    new.raw_user_meta_data ->> 'full_name',
    new.raw_user_meta_data ->> 'avatar_url',
    new.raw_user_meta_data ->> 'email'
  );

return new;

end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
after
insert
  on auth.users for each row execute procedure public.handle_new_user();

-- Set up Storage!
insert into
  storage.buckets (id, name)
values
  ('avatars', 'avatars');

-- Set up access controls for storage.
-- See https://supabase.com/docs/guides/storage#policy-examples for more details.
create policy "Avatar images are publicly accessible." on storage.objects for
select
  using (bucket_id = 'avatars');

create policy "Anyone can upload an avatar." on storage.objects for
insert
  with check (bucket_id = 'avatars');