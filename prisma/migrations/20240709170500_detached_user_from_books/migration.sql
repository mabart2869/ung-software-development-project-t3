/*
  Warnings:

  - You are about to drop the column `userId` on the `Book` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Book" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "publishedDate" DATETIME NOT NULL,
    "isbn" TEXT NOT NULL,
    "minAge" INTEGER NOT NULL,
    "maxAge" INTEGER NOT NULL,
    "lastActivity" DATETIME NOT NULL
);
INSERT INTO "new_Book" ("id", "isbn", "lastActivity", "maxAge", "minAge", "publishedDate", "title") SELECT "id", "isbn", "lastActivity", "maxAge", "minAge", "publishedDate", "title" FROM "Book";
DROP TABLE "Book";
ALTER TABLE "new_Book" RENAME TO "Book";
CREATE UNIQUE INDEX "Book_isbn_key" ON "Book"("isbn");
CREATE INDEX "Book_title_idx" ON "Book"("title");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;