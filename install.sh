#!/usr/bin/env bash
set -ex

curl -sL https://deb.nodesource.com/setup_12.x |  bash - && apt update && apt install -y nodejs && node --version
npm install -g @redocly/openapi-cli redoc-cli
git clone https://github.com/go-swagger/go-swagger /tmp/go-swagger && cd /tmp/go-swagger && go install ./cmd/swagger