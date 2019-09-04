package ackhandler

import "v2ray.com/core/external/github.com/lucas-clemente/quic-go/internal/wire"

type Frame struct {
	wire.Frame // nil if the frame has already been acknowledged in another packet
	OnLost     func(wire.Frame)
	OnAcked    func()
}
