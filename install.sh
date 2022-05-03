#!/usr/bin/env bash
set -ex

apt-get update

echo "Install go-swagger"
git clone https://github.com/go-swagger/go-swagger /tmp/go-swagger && cd /tmp/go-swagger && go install ./cmd/swagger

echo "Install reviewdog"
curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/bin

echo "Install golangci-lint"
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/bin v1.42.0

echo "Install go-junit-report"
go install github.com/jstemmer/go-junit-report@latest




### Install buf
# Substitute BIN for your bin directory.
# Substitute VERSION for the current released version.
BIN="/usr/local/bin" && \
VERSION="1.4.0" && \
  curl -sSL \
    "https://github.com/bufbuild/buf/releases/download/v${VERSION}/buf-$(uname -s)-$(uname -m)" \
    -o "${BIN}/buf" && \
  chmod +x "${BIN}/buf"
