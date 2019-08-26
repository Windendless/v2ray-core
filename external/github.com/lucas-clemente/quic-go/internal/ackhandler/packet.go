package ackhandler

import (
	"time"

	"v2ray.com/core/external/github.com/lucas-clemente/quic-go/internal/protocol"
	"v2ray.com/core/external/github.com/lucas-clemente/quic-go/internal/wire"
)

// A Packet is a packet
type Packet struct {
	PacketNumber    protocol.PacketNumber
	Frames          []wire.Frame
	LargestAcked    protocol.PacketNumber // InvalidPacketNumber if the packet doesn't contain an ACK
	Length          protocol.ByteCount
	EncryptionLevel protocol.EncryptionLevel
	SendTime        time.Time

	// There are two reasons why a packet cannot be retransmitted:
	// * it was already retransmitted
	// * this packet is a retransmission, and we already received an ACK for the original packet
	canBeRetransmitted      bool
	includedInBytesInFlight bool
	retransmittedAs         []protocol.PacketNumber
	isRetransmission        bool // we need a separate bool here because 0 is a valid packet number
	retransmissionOf        protocol.PacketNumber
}

func (p *Packet) ToPacket() *protocol.Packet {
	return &protocol.Packet{
		PacketNumber: p.PacketNumber,
		Length:       p.Length,
		SendTime:     p.SendTime,
	}
}
