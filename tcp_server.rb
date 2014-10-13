#!/usr/bin/ruby
# coding: utf-8

require 'socket'

READ_TIMEOUT = 0.5
LISTEN_PORT = 10000

server = TCPServer.open("192.168.33.10", 10000)
addr = server.addr
puts "Listening #{addr[3]} (#{addr[1]})"

begin
  loop do
    Thread.start(server.accept) do |io|
      peer = io.peeraddr
      puts "Connected from #{peer[3]} (#{peer[1]})"
      begin
        p Time.now.strftime("%H:%M:%S")
        loop do
          reads, writes, excepts = IO.select([io], nil, nil, READ_TIMEOUT)
          raise 'Connection timeout.' unless reads
          raise 'Connection closed.' unless char = io.read(1)
          print sprintf("0x%02X, ", char.unpack("C*")[0])
          io.write char
        end
      rescue RuntimeError
        p Time.now.strftime("%H:%M:%S")
        puts $!.message
      end
      io.close
    end
  end
rescue Interrupt
  puts 'Interrupted.'
end

server.close
puts 'Done.'
