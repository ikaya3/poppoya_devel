module Poppoya
  module Telegram
    class TelegramFactory
      def initialize
        @constructing_bytes   = Array.new
        @constructed_telegram = Array.new
      end

      def push_byte(*bytes)
        bytes.each do |byte|
          append(byte)
        end
      end

      def pop_telegram
        @constructed_telegram.shift
      end

      private
      def append(byte)
        @constructing_bytes << byte
        if @constructing_bytes.size >= 5
          @constructed_telegram.push(Telegram.new(@constructing_bytes))
          @constructing_bytes.clear
        end
      end
    end
  end
end
