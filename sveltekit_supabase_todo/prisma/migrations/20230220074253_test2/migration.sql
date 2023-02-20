-- CreateTable
CREATE TABLE "changhoon2" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "title" TEXT,

    CONSTRAINT "changhoon2_pkey" PRIMARY KEY ("id")
);

alter table "changhoon2" enable row level security;

CREATE POLICY "Public changhoon2 are viewable by everyone."
  on "changhoon2" for select
  using ( true );