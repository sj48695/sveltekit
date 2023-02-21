-- CreateTable
CREATE TABLE IF NOT EXISTS "investors" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "status" TEXT,
    "acceped_at" TIMESTAMPTZ(6),
    "project_id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6),

    CONSTRAINT "investors_pkey" PRIMARY KEY ("id")
    -- ,
    -- CONSTRAINT "investors_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE SET NULL ON UPDATE CASCADE,
    -- CONSTRAINT "investors_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- AddForeignKey
-- ALTER TABLE "investors" DROP CONSTRAINT IF EXISTS "investors_pkey";
-- ALTER TABLE "investors" ADD CONSTRAINT "investors_pkey" PRIMARY KEY ("id");
ALTER TABLE "investors" DROP CONSTRAINT IF EXISTS "investors_project_id_fkey";
ALTER TABLE "investors" ADD CONSTRAINT "investors_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "investors" DROP CONSTRAINT IF EXISTS "investors_user_id_fkey";
ALTER TABLE "investors" ADD CONSTRAINT "investors_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
