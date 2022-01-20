-- CreateEnum
CREATE TYPE "SignupMethod" AS ENUM ('EMAIL', 'GOOGLE', 'TWITTER');

-- CreateEnum
CREATE TYPE "SocialProvider" AS ENUM ('GOOGLE', 'TWITTER');

-- CreateTable
CREATE TABLE "SocialConnection" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "provider" "SocialProvider" NOT NULL,
    "providerEmail" TEXT NOT NULL,
    "providerUsername" TEXT NOT NULL,
    "providerUserId" TEXT NOT NULL,
    "isRegistrationConnection" BOOLEAN NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "SocialConnection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TokenCluster" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "accessToken" TEXT NOT NULL,
    "refreshToken" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "TokenCluster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "username" TEXT NOT NULL,
    "signupMethod" "SignupMethod" NOT NULL,
    "isVerified" BOOLEAN,
    "email" TEXT NOT NULL,
    "password" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TokenCluster_accessToken_key" ON "TokenCluster"("accessToken");

-- CreateIndex
CREATE UNIQUE INDEX "TokenCluster_refreshToken_key" ON "TokenCluster"("refreshToken");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "SocialConnection" ADD CONSTRAINT "SocialConnection_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TokenCluster" ADD CONSTRAINT "TokenCluster_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
