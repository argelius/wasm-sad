const fs = require('fs');

const bytes = Array.from(fs.readFileSync('sad.wasm'));

function zeroPad(s) {
  return `0${s}`.substr(-2, 2);
}

const array = bytes
  .map(byte => `0x${zeroPad(byte.toString(16))}`)
  .join(', ');

inFile = fs.readFileSync('index.js').toString();

inFile = inFile.replace('WASM_BYTES', array);

console.log(inFile);
