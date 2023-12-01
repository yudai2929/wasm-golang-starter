
build:
	GOOS=js GOARCH=wasm go build -o public/wasm/main.wasm cmd/wasm/main.go

run:
	go run cmd/wasm/main.go

run-server:
	go run cmd/server/main.go

exec:
	wasmtime  ./public/wasm/main.wasm --invoke add 1 2

wat:
	wasm2wat public/wasm/main.wasm > public/wasm/main.wat

wasm-dump:
	wasm-objdump -x public/wasm/main.wasm > dist/main.wasm.wasmdump

llvm-dwarfdump:
	llvm-dwarfdump -debug-info -debug-line --recurse-depth=0 public/wasm/main.wasm > dist/main.wasm.dwarfdump

PHONY: build run exec wat wasm-dump llvm-dwarfdump