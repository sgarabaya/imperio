import * as fs from "node:fs";
import { sleep } from "./utils.ts";
import { Capture } from "./capture.ts";

import postgres from "npm:postgres";

const connect = () => postgres("postgres://postgres:root@localhost:5432/Imperio");

async function executeScript(script: string) {
  const sql = connect();
  await sql.unsafe(script);
  await sql.end();
}

async function executeFile(file: string) {
  const sql = connect();
  await sql.file(file);
  await sql.end();
}

try {
  console.log("Cleaning DB...");
  executeScript('DROP SCHEMA public CASCADE;CREATE SCHEMA public;');

  const part1_files = [
    "sql/p1-01-tablas.sql",
    "sql/p1-02-datos.sql",
    "sql/p1-03.01-queries.sql",
    "sql/p1-03.02-queries.sql",
    "sql/p1-03.03-queries.sql",
    "sql/p1-03.04-queries.sql",
    "sql/p1-03.05-queries.sql",
  ];

  for (const file of part1_files) {
    await executeFile(file);
  }
} catch (ex) {
  console.error(ex);
}

fs.mkdirSync("./output/images", { recursive: true });

for (let i = 0; i < 5; i += 1) {
  console.log(`${i}...`);
  sleep(1000);
}

const part2_files: string[] = [
  "sql/p2-01-planetas.sql",
  "sql/p2-02-naves.sql",
  "sql/p2-03-tablas.sql",
  "sql/p2-05.1-queries.sql",
  "sql/p2-05.2-queries.sql",
  "sql/p2-05.3-queries.sql",
  "sql/p2-05.4-queries.sql",
  "sql/p2-05.5-queries.sql",
];

for (const file of part2_files) {
  new Capture(file).exec();
}
