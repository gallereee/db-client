/*
  Warnings:

  - You are about to drop the column `photoId` on the `File` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[fileId]` on the table `Photo` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `fileId` to the `Photo` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "File" DROP CONSTRAINT "File_photoId_fkey";

-- DropIndex
DROP INDEX "File_photoId_key";

-- AlterTable
ALTER TABLE "File" DROP COLUMN "photoId";

-- AlterTable
ALTER TABLE "Photo" ADD COLUMN     "fileId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Photo_fileId_key" ON "Photo"("fileId");

-- AddForeignKey
ALTER TABLE "Photo" ADD CONSTRAINT "Photo_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES "File"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
