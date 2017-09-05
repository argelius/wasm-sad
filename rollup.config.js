import fs from 'fs';
import { rollup } from 'rollup';
import babel from 'rollup-plugin-babel';
import replace from 'rollup-plugin-replace';

const bytes = Array.from(fs.readFileSync('sad.wasm'));

function zeroPad(s) {
  return `0${s}`.substr(-2, 2);
}

const array = bytes
  .map(byte => `0x${zeroPad(byte.toString(16))}`)
  .join(', ');

export default {
  input: 'index.js',
  output: {
    file: 'dist.js',
    format: 'cjs',
  },
  plugins: [
    babel(),
    replace({
      WASM_BYTES: array,
    }),
  ],
};
