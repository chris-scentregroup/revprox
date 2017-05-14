.PHONY: clean
build: clean
	env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o build/revprox -a -ldflags '-w -s' cmd/revprox/main.go

dev:
	go run cmd/revprox/main.go

clean:
	rm -rf build/

upload: build
	gsutil cp -a public-read build/revprox gs://acoshift/
