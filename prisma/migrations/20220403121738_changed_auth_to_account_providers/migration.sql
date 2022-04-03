/*
  Warnings:

  - You are about to drop the `AuthProvider` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "AccountProviderType" AS ENUM ('TELEGRAM_USER');

-- DropForeignKey
ALTER TABLE "AuthProvider" DROP CONSTRAINT "AuthProvider_accountId_fkey";

-- DropTable
DROP TABLE "AuthProvider";

-- DropEnum
DROP TYPE "AuthProviderType";

-- CreateTable
CREATE TABLE "AccountProvider" (
    "id" TEXT NOT NULL,
    "type" "AccountProviderType" NOT NULL,
    "externalAccountId" TEXT NOT NULL,
    "externalAccountData" JSONB,
    "accountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AccountProvider_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AccountProvider" ADD CONSTRAINT "AccountProvider_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "Account"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
