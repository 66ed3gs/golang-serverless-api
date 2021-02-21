.PHONY: goimports
goimports:
	cd /tmp && go get golang.org/x/tools/cmd/goimports

.PHONY: bootstrap
bootstrap: goimports
	mkdir -p ./bin
	curl -L -o ./bin/server_generator.tar.gz https://github.com/go-generalize/api_gen/releases/latest/download/server_generator_$(shell uname -s)_$(shell uname -m).tar.gz
	cd ./bin && \
		tar xzf server_generator.tar.gz && \
		rm *.tar.gz

.PHONY: server_generate
server_generate:
	./bin/server_generator ./interfaces

.PHONY: generate
generate: server_generate