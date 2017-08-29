
const SAD = require('./dist');
const N = 100000;

const A = new Uint8ClampedArray(N);
const B = new Uint8ClampedArray(N);

for (let i = 0; i < N; i += 1) {
  A[i] = Math.floor(255 * Math.random());
  B[i] = Math.floor(255 * Math.random());
}

let now = Date.now();

for (let i = 0; i < 10000; i += 1) {
  SAD(A, B);
}

console.log(`WASM took ${Date.now() - now}ms.`);

now = Date.now();

for (let i = 0; i < 10000; i += 1) {
  SAD(A, B, { useJS: true });
}

console.log(`JS took ${Date.now() - now}ms.`);
