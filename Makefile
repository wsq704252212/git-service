.PHONY: tools
tools:
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(shell go env GOPATH)/bin v1.55.2
	go install github.com/go-swagger/go-swagger/cmd/swagger@v0.30.5

.PHONY: lint
lint:
	golangci-lint run --timeout 90m ./...

.PHONY: format
format:
	golangci-lint run --fix ./...

.PHONY: test
test:
	go test -cover ./...

.PHONY: swagger
swagger:
	swagger generate spec -o ./pkg/swagger-ui/swagger.json
