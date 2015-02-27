# -*- coding: utf-8 -*-
require 'socket'

module Poppoya
  module Node
    class ServerSocket
      READ_TIMEOUT = 0.5
      @socket
      @received

      def initialize(id)
        @received = Array.new
      end

      def start
        @socket = TCPServer.open("<any>", 10000)
        loop do
          # 同時に1つしか connect できないよう、 thread は起こさない
          io = @socket.accept
          begin
            loop do
              reads, writes, excepts = IO.select([io], nil, nil, READ_TIMEOUT)
              raise 'Connection timeout.' unless reads
              raise 'Connection closed.' unless char = io.read(1)
              @received << char
              p @received
            end
          rescue RuntimeError
          end
        end
      end

      def read
      end
    end
  end
end
