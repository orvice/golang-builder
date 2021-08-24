#!/usr/bin/env bash
set -ex

echo "Install go-swagger"
git clone https://github.com/go-swagger/go-swagger /tmp/go-swagger && cd /tmp/go-swagger && go install ./cmd/swagger

echo "Install reviewdog"
curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/bin

echo "Install golangci-lint"
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/bin v1.42.0

echo "Install go-junit-report"
go get -u github.com/jstemmer/go-junit-report