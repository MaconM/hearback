-- CreateTable
CREATE TABLE "AgendaItem" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "context" TEXT NOT NULL,
    "decisionQuestion" TEXT NOT NULL,
    "commentOpenAt" DATETIME NOT NULL,
    "responseByDate" DATETIME NOT NULL,
    "responseOwnerName" TEXT NOT NULL,
    "responseOwnerRole" TEXT NOT NULL,
    "synthesisPublishedAt" DATETIME,
    "responsePublishedAt" DATETIME,
    "responseStatus" TEXT,
    "responseRationale" TEXT,
    "responseNextStep" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Theme" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "agendaItemId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "position" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Theme_agendaItemId_fkey" FOREIGN KEY ("agendaItemId") REFERENCES "AgendaItem" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Submission" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "agendaItemId" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "neighborhood" TEXT,
    "comment" TEXT NOT NULL,
    "consent" BOOLEAN NOT NULL DEFAULT false,
    "featured" BOOLEAN NOT NULL DEFAULT false,
    "themeId" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Submission_agendaItemId_fkey" FOREIGN KEY ("agendaItemId") REFERENCES "AgendaItem" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "Submission_themeId_fkey" FOREIGN KEY ("themeId") REFERENCES "Theme" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
