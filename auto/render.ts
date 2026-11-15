import * as fs from "node:fs";

const output: string[] = [];

const template = fs.readFileSync('./output/TP2-template.md', 'utf-8').split('\n');

for (const line of template) {
    if (line.startsWith('@include')) {
        const path = line.replace('@include', '').trim();
        const file = fs.readFileSync(`./output/${path}`, 'utf-8');
        output.push(file);
    } else {
        output.push(line);
    }
}

fs.writeFileSync('./output/TP2.md', output.join('\n'), 'utf-8');
