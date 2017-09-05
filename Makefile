sad.wasm: sad.wast
	wast2wasm sad.wast -o sad.wasm
	wasm-opt -O2 sad.wasm -o sad.wasm

dist.js: sad.wasm index.js
	./node_modules/.bin/rollup -c
