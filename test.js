import test from 'ava';
import sad from './dist';

const A = new Uint8Array([1, 2, 3, 4, 5]);
const B = new Uint8Array([1, 1, 1, 1, 1]);

test('sad', (t) => {
  const actual = sad(A, B);
  const expected = 10;

  t.is(actual, expected, 'It should return the correct value.');
});

test('sad: normalize', (t) => {
  const actual = sad(A, B, { normalize: true });
  const expected = 2;

  t.is(actual, expected, 'It should return the correct value.');
});

test('sad: useJS', (t) => {
  const actual = sad(A, B, { useJS: true });
  const expected = 10;

  t.is(actual, expected, 'It should return the correct value.');
});

test('sad: large', (t) => {
  const N = 1000000;
  const Alarge = new Uint8Array(N);
  const Blarge = new Uint8Array(N);

  for (let i = 0; i < N; i += 1) {
    Alarge[i] = Math.floor(255 * Math.random());
    Blarge[i] = Math.floor(255 * Math.random());
  }

  const actual = sad(Alarge, Blarge);
  let expected = 0;

  for (let i = 0; i < N; i += 1) {
    expected += Math.abs(Alarge[i] - Blarge[i]);
  }

  t.is(actual, expected, 'It should return the correct value');
});
