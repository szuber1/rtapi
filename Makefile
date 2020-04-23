default: build_darwin

all: build_darwin build_linux build_windows

build_darwin: packrd
	GOOS=darwin GOARCH=amd64 go build -mod vendor -o build/darwin/rtapi
	cd build/darwin && zip rtapi-mac.zip rtapi

build_linux: packrd
	GOOS=linux GOARCH=amd64 go build -mod vendor -o build/linux/rtapi
	cd build/linux && zip rtapi-linux.zip rtapi

build_windows: packrd
	GOOS=windows GOARCH=amd64 go build -mod vendor -o build/windows/rtapi
	cd build/windows && zip rtapi-windows.zip rtapi

packrd:
	packr2

clean:
	rm -rf build/
	packr2 clean
