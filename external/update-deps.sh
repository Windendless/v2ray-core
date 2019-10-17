#!/bin/bash

pushd $GOPATH/src/v2ray.com/core/external

rsync -rv --delete "$GOPATH/src/github.com/golang/protobuf/" "./github.com/golang/protobuf/"
rsync -rv --delete "$GOPATH/src/github.com/marten-seemann/qtls/" "./github.com/marten-seemann/qtls/"

rsync -rv --delete "$GOPATH/src/github.com/lucas-clemente/quic-go/" "./github.com/lucas-clemente/quic-go/"
rm -rf ./github.com/lucas-clemente/quic-go/\.*
rm -rf ./github.com/lucas-clemente/quic-go/benchmark
rm -rf ./github.com/lucas-clemente/quic-go/docs
rm -rf ./github.com/lucas-clemente/quic-go/example
rm -rf ./github.com/lucas-clemente/quic-go/http3
rm -rf ./github.com/lucas-clemente/quic-go/integrationtests
rm -rf ./github.com/lucas-clemente/quic-go/internal/mocks
rm ./github.com/lucas-clemente/quic-go/vendor/vendor.json

rsync -rv "$GOPATH/src/github.com/gorilla/websocket/" "./github.com/gorilla/websocket/"
rm -rf ./github.com/gorilla/websocket/\.*
rm -rf ./github.com/gorilla/websocket/examples
rm "./github.com/gorilla/websocket/.gitignore"
rm "./github.com/gorilla/websocket/client_clone_legacy.go"
rm "./github.com/gorilla/websocket/compression.go"
rm "./github.com/gorilla/websocket/conn_write_legacy.go"
rm "./github.com/gorilla/websocket/json.go"
rm "./github.com/gorilla/websocket/prepared.go"
rm "./github.com/gorilla/websocket/proxy.go"
rm "./github.com/gorilla/websocket/trace_17.go"
rm "./github.com/gorilla/websocket/trace.go"
rm "./github.com/gorilla/websocket/x_net_proxy.go"

rsync -rv "$GOPATH/src/github.com/refraction-networking/utls/" "./github.com/refraction-networking/utls/"
rm -rf ./github.com/refraction-networking/utls/\.*
rm -rf ./github.com/refraction-networking/utls/examples
rm -rf ./github.com/refraction-networking/utls/testdata
rm -rf ./github.com/refraction-networking/utls/testenv


find . -name ".git" -delete

find . -name "*_test.go" -delete
find . -name "*.yml" -delete
find . -name "*.go" -type f -print0 | LC_ALL=C xargs -0 sed -i '' 's#\"github\.com#\"v2ray\.com/core/external/github\.com#g'

popd
