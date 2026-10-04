import * as fs from "node:fs";
import { sleep } from "./utils.ts";
import { Capture, runStatement } from "./capture.ts";

fs.mkdirSync("./output/images", { recursive: true });

for (let i = 0; i < 5; i += 1) {
  console.log(`${i}...`);
  sleep(1000);
}

console.log("Cleaning DB...");
runStatement(`DROP SCHEMA public CASCADE;CREATE SCHEMA public;`);

const files = [
  "sql/01-tablas.sql",
  "sql/02-datos.sql",
  "sql/03.01-queries.sql",
  "sql/03.02-queries.sql",
  "sql/03.03-queries.sql",
  "sql/03.04-queries.sql",
  "sql/03.05-queries.sql",
];

for (const file of files) {
  new Capture(file).exec();
}
