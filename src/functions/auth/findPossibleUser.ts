import { User } from "@prisma/client";
import { prisma } from "~/providers/prisma";

export async function findPossibleUser(data: string): Promise<User | false> {
  let query = await prisma.user.
}