#!/usr/bin/ruby

require "socket"

DST_IP   = "192.168.33.10"
DST_PORT = "10000"
SRC_IP   = "192.168.33.11"

BODY = [0xFF, 0x00, 0x00, 0x03, 0x12, 0x34, 0x44]

begin
  loop do
    begin
      sleep 1
      s = TCPSocket.open(DST_IP, DST_PORT, SRC_IP)
      s.write BODY.pack("C*")
    rescue
      p $!.message
    end
  end
rescue Interrupt
  puts 'Interrupted.'
end
