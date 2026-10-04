import * as fs from "node:fs";
import * as path from "node:path";
import { execSync } from "node:child_process";
import { sleep } from "./utils.ts";

const encoder = new TextEncoder();
const stdout = Deno.stdout;
const print = (msg: string) => stdout.writeSync(encoder.encode(msg));

export const runStatement = (input: string): void => {
  print("Copy");
  execSync("wl-copy -t text/plain > /dev/null 2>&1", { input });
  sleep(50);

  print(": Ctrl+A");
  execSync("wtype -M ctrl -k a -m ctrl");
  sleep(50);

  print(": Ctrl+V");
  execSync("wtype -M ctrl -k v -m ctrl");
  sleep(50);

  print(": F5");
  execSync("wtype -k F5");
  sleep(250);
};

export class Capture {
  private readonly file: string;
  private readonly fileId: string;
  private readonly outFile: string;

  constructor(file: string) {
    this.file = file;
    this.fileId = path.basename(file).replace(".sql", "");
    this.outFile = path.join("output", `${this.fileId}.md`);
  }

  private parseFile(): string[] {
    const lines = fs
      .readFileSync(this.file, "utf-8")
      .split("\n")
      .filter((l) => l.trim().length !== 0)
      .filter((l) => !l.trim().startsWith("--"));

    return lines
      .join("\n")
      .split(";\n")
      .map((l) => (l.endsWith(";") ? l : l + ";"));
  }

  private append(line: string): void {
    fs.appendFileSync(this.outFile, `${line}\n`, "utf-8");
  }

  private runStatement(statement: string, index: number): void {
    runStatement(statement);

    const queryId = `${this.fileId}-${index.toString().padStart(3, "0")}`;

    print(": Print");
    execSync("niri msg action screenshot-window -d false -p false");
    sleep(50);

    print(": Insert\n");

    execSync(`wl-paste -n > output/images/${queryId}.png`);
    sleep(50);

    this.append("```sql");
    this.append(statement);
    this.append("```\n");

    this.append(`![](images/${queryId}.png)\n`);

    this.append(`\\newpage`);
    this.append("\n\n");
  }

  exec() {
    const statements = this.parseFile();

    this.append(`# ${this.fileId}\n\n`);

    for (let index = 0; index < statements.length; index += 1) {
      const statement = statements[index];

      console.log("------------------");
      console.log(`${index + 1}/${statements.length}`, "Executing:", statement);
      console.log("------------------");
      this.runStatement(statement, index + 1);
    }
  }
}
