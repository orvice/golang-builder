#!/usr/bin/env bash
set -ex

curl -sL https://deb.nodesource.com/setup_12.x |  bash - && apt update && apt install -y nodejs && node --version
npm install -g @redocly/openapi-cli redoc-cli
git clone https://github.com/go-swagger/go-swagger /tmp/go-swagger && cd /tmp/go-swagger && go install ./cmd/swagger

echo "Install reviewdog"
curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/bin

echo "Install golangci-lint"
# binary will be $(go env GOPATH)/bin/golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.42.0
