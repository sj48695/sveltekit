-- -- Set up Row Level Security (RLS)
-- -- See https://supabase.com/docs/guides/auth/row-level-security for more details.
-- alter table users
--   enable row level security;

-- create policy "Public users are viewable by everyone." on users
--   for select using (true);

-- create policy "Users can insert their own profile." on users
--   for insert with check (auth.uid() = id);

-- create policy "Users can update own profile." on users
--   for update using (auth.uid() = id);

-- CreateTable
CREATE TABLE IF NOT EXISTS "companies" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT,

    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6),

    CONSTRAINT "companies_pkey" PRIMARY KEY ("id")
);
