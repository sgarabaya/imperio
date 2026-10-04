export const sleep = (ms: number) =>
  Atomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, ms);

function jenkins(input: string): number {
  let hash = 0;

  for (let i = 0; i < input.length; i += 1) {
    hash += input.charCodeAt(i);
    hash += hash << 10;
    hash ^= hash >> 6;
  }
  hash += hash << 3;
  hash ^= hash >> 11;
  hash += hash << 15;

  return hash;
}

export const hash = (input: string) => `${jenkins(input)}`;
