package utils

import (
	"v2ray.com/core/external/github.com/lucas-clemente/quic-go/internal/protocol"
)

// NewConnectionID is a new connection ID
type NewConnectionID struct {
	SequenceNumber      uint64
	ConnectionID        protocol.ConnectionID
	StatelessResetToken protocol.StatelessResetToken
}
