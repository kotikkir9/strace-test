all: c cpp dotnet dotnet-aot go rust strace

c:
	@gcc -o c/main c/main.c -O2 -Wall -Wextra -pedantic

cpp:
	@g++ -o cpp/main cpp/main.cpp -O2 -Wall -Wextra -pedantic

dotnet:
	@dotnet publish -c Release -o dotnet/publish dotnet/dotnet.csproj

dotnet-aot:
	@dotnet publish -c Release -o dotnet-aot/publish dotnet-aot/dotnet-aot.csproj

go:
	@/usr/local/go/bin/go build -ldflags="-s -w -X main.version=1.0.0" -o go/main go/main.go

rust:
	@cargo build --release --manifest-path rust/Cargo.toml

strace:
	@clear

	@echo "C:"
	@echo "---------------------------------------------------------------------"
	@strace -c c/main
	@echo

	@echo "C++:"
	@echo "---------------------------------------------------------------------"
	@strace -c cpp/main
	@echo

	@echo "C#:"
	@echo "---------------------------------------------------------------------"
	@strace -c dotnet dotnet/publish/dotnet.dll
	@echo

	@echo "C# AOT:"
	@echo "---------------------------------------------------------------------"
	@strace -c dotnet-aot/publish/dotnet-aot
	@echo

	@echo "Go:"
	@echo "---------------------------------------------------------------------"
	@strace -c go/main
	@echo

	@echo "Rust:"
	@echo "---------------------------------------------------------------------"
	@strace -c rust/target/release/rust
	@echo

	@echo "Python:"
	@echo "---------------------------------------------------------------------"
	@strace -c python3 python/app.py
	@echo

	@echo "NodeJS:"
	@echo "---------------------------------------------------------------------"
	@strace -c node node/index.mjs
	@echo

.PHONY: all c cpp dotnet dotnet-aot go rust strace