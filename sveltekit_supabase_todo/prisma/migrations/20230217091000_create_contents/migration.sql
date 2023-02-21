-- CreateTable
CREATE TABLE IF NOT EXISTS "contents" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "title" TEXT,
    "sub_title" TEXT,
    "description" TEXT,
    "order" INTEGER DEFAULT 0,
    "type" TEXT,
    "link_url" TEXT,
    "thumbnail" TEXT,
    "images" TEXT[],
    "project_id" UUID,
    "user_id" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6),

    CONSTRAINT "contents_pkey" PRIMARY KEY ("id")
    -- ,
    -- CONSTRAINT "contents_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE SET NULL ON UPDATE CASCADE,
    -- CONSTRAINT "contents_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- AddForeignKey
ALTER TABLE "contents" DROP CONSTRAINT IF EXISTS "contents_project_id_fkey";
ALTER TABLE "contents" ADD CONSTRAINT "contents_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "contents" DROP CONSTRAINT IF EXISTS "contents_user_id_fkey";
ALTER TABLE "contents" ADD CONSTRAINT "contents_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
