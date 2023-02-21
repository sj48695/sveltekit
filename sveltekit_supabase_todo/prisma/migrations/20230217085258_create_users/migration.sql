-- CreateEnum
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'Role') THEN
        CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN');
    END IF;
END$$;

-- CreateTable
CREATE TABLE IF NOT EXISTS "users" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "username" TEXT,
    "full_name" TEXT,
    "avatar_url" TEXT,
    "phone_number" TEXT,
    "email" TEXT,
    "birthday" DATE,
    "role" TEXT,
    -- "role" "Role" NOT NULL DEFAULT 'USER',

    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6),

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

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

-- CreateIndex
CREATE UNIQUE INDEX IF NOT EXISTS "users_username_key" ON "users"("username");
