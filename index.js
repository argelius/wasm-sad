const bytes = new Uint8Array([WASM_BYTES]);

let wasmSad = null;

function jsSad(A, B) {
  let sum = 0;

  for (let i = 0; i < A.length; i += 1) {
    sum += Math.abs(A[i] - B[i]);
  }

  return sum;
}

if ('WebAssembly' in global) {
  const env = {
    memoryBase: 0,
    tableBase: 0,
    memory: new WebAssembly.Memory({ initial: 256 }),
    table: new WebAssembly.Table({ initial: 0, element: 'anyfunc' }),
  };

  const module = new WebAssembly.Module(bytes);
  const instance = new WebAssembly.Instance(module, { env: env });
  const data = new Uint8ClampedArray(instance.exports.mem.buffer);

  wasmSad = (A, B) => {
    const l = A.length;
    data.set(A, 0);
    data.set(B, l);
    return instance.exports.sad(0, l, l);
  };
}

module.exports = (A, B, { normalize = false, useJS = false } = {}) => {
  if (A.length !== B.length) {
    throw new Error('Arrays must be same dimension');
  }

  const diff = wasmSad === null || useJS ? jsSad(A, B) : wasmSad(A, B);

  if (normalize) {
    return diff / A.length;
  }

  return diff;
};
