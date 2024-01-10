#!/usr/bin/env bash
set -ex

apt-get update

echo "Install go-swagger"
git clone https://github.com/go-swagger/go-swagger /tmp/go-swagger && cd /tmp/go-swagger && go install ./cmd/swagger

echo "Install reviewdog"
curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/bin

echo "Install golangci-lint"
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/bin v1.50.1

echo "Install go-junit-report"
go install github.com/jstemmer/go-junit-report@latest




##  Install procto
echo "Install protoc"
apt install -y protobuf-compiler

echo "Install protoc-gen-go"
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
echo "Install protoc-gen-go-grpc"
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2

echo "Install protoc-gen-doc"
go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@v1.5.0


echo "install protoc-gen-connect-go"
go install github.com/bufbuild/buf/cmd/buf@latest
go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install connectrpc.com/connect/cmd/protoc-gen-connect-go@latest

echo "Install protoc-gen-gofast"
go install github.com/gogo/protobuf/protoc-gen-gofast@v1.3.2
go install github.com/gogo/protobuf/protoc-gen-gogo@v1.3.2


go install github.com/twitchtv/twirp/protoc-gen-twirp@latest

go install github.com/apptreesoftware/protoc-gen-twirp_dart@latest

go install github.com/thechriswalker/protoc-gen-twirp_js@latest

### Install buf
# Substitute BIN for your bin directory.
# Substitute VERSION for the current released version.
BIN="/usr/local/bin" && \
VERSION="1.4.0" && \
  curl -sSL \
    "https://github.com/bufbuild/buf/releases/download/v${VERSION}/buf-$(uname -s)-$(uname -m)" \
    -o "${BIN}/buf" && \
  chmod +x "${BIN}/buf"
