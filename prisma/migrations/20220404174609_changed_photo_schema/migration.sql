/*
  Warnings:

  - You are about to drop the column `groupId` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the `PhotoSize` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `height` to the `Photo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `width` to the `Photo` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "FileProvider" AS ENUM ('TELEGRAM');

-- DropForeignKey
ALTER TABLE "PhotoSize" DROP CONSTRAINT "PhotoSize_photoId_fkey";

-- DropIndex
DROP INDEX "Post_groupId_key";

-- AlterTable
ALTER TABLE "Photo" ADD COLUMN     "height" INTEGER NOT NULL,
ADD COLUMN     "width" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "groupId";

-- DropTable
DROP TABLE "PhotoSize";

-- CreateTable
CREATE TABLE "File" (
    "id" TEXT NOT NULL,
    "provider" "FileProvider" NOT NULL,
    "photoId" TEXT NOT NULL,
    "data" JSONB NOT NULL,

    CONSTRAINT "File_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "File_photoId_key" ON "File"("photoId");

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_photoId_fkey" FOREIGN KEY ("photoId") REFERENCES "Photo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
