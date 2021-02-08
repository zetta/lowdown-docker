
.PHONY: configure
configure:
	git clone git@github.com:kristapsdz/lowdown.git

.PHONY: build
build:
	cp Dockerfile lowdown/Dockerfile
	docker build --rm --no-cache --progress=plain -t zettacio/lowdown:latest lowdown

.PHONY: clean
clean:
	rm -rf ./lowdown

.PHONY: publish
publish:
	docker push zettacio/lowdown:latest
