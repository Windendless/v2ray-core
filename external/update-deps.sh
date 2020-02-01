#!/bin/bash

pushd $GOPATH/src/v2ray.com/core/external

rsync -rv --delete "$GOPATH/src/github.com/golang/protobuf/" "./github.com/golang/protobuf/"
rsync -rv --delete "$GOPATH/src/github.com/marten-seemann/qtls/" "./github.com/marten-seemann/qtls/"
rsync -rv --delete "$GOPATH/src/github.com/marten-seemann/chacha20/" "./github.com/marten-seemann/chacha20/"


rsync -rv --delete "$GOPATH/src/github.com/lucas-clemente/quic-go/" "./github.com/lucas-clemente/quic-go/"
rm -rf ./github.com/lucas-clemente/quic-go/\.*
rm -rf ./github.com/lucas-clemente/quic-go/benchmark
rm -rf ./github.com/lucas-clemente/quic-go/docs
rm -rf ./github.com/lucas-clemente/quic-go/example
rm -rf ./github.com/lucas-clemente/quic-go/http3
rm -rf ./github.com/lucas-clemente/quic-go/integrationtests
rm -rf ./github.com/lucas-clemente/quic-go/internal/mocks
rm -rf ./github.com/lucas-clemente/quic-go/interop
rm -rf ./github.com/lucas-clemente/quic-go/fuzzing
rm -rf ./github.com/lucas-clemente/quic-go/internal/testutils/
rm -rf ./github.com/lucas-clemente/quic-go/quictrace
rm -rf ./github.com/lucas-clemente/quic-go/internal/testdata


find . -name ".git" -delete
find . -name "*_test.go" -delete
find . -name "*.yml" -delete
find . -name "*.go" -type f -print0 | LC_ALL=C xargs -0 sed -i '' 's#\"github\.com#\"v2ray\.com/core/external/github\.com#g'

popd
