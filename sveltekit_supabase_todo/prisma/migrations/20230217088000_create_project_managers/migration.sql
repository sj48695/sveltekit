-- CreateTable
CREATE TABLE IF NOT EXISTS "project_managers" (
    "user_id" UUID NOT NULL,
    "company_id" UUID NOT NULL,
    "role" TEXT,

    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6),

    CONSTRAINT "project_managers_pkey" PRIMARY KEY ("company_id","user_id")
);

-- AddForeignKey
ALTER TABLE "project_managers" DROP CONSTRAINT IF EXISTS "project_managers_company_id_fkey";
ALTER TABLE "project_managers" ADD CONSTRAINT "project_managers_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "companies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "project_managers" DROP CONSTRAINT IF EXISTS "project_managers_user_id_fkey";
ALTER TABLE "project_managers" ADD CONSTRAINT "project_managers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
