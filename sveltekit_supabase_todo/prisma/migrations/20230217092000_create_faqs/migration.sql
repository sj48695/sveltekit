-- CreateTable
CREATE TABLE IF NOT EXISTS "faqs" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "question" TEXT,
    "answer" TEXT,
    "project_id" UUID,
    "user_id" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6),

    CONSTRAINT "faqs_pkey" PRIMARY KEY ("id")
    -- ,
    -- CONSTRAINT "faqs_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE SET NULL ON UPDATE CASCADE,
    -- CONSTRAINT "faqs_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- AddForeignKey
ALTER TABLE "faqs" DROP CONSTRAINT IF EXISTS "faqs_project_id_fkey";
ALTER TABLE "faqs" ADD CONSTRAINT "faqs_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "faqs" DROP CONSTRAINT IF EXISTS "faqs_user_id_fkey";
ALTER TABLE "faqs" ADD CONSTRAINT "faqs_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
