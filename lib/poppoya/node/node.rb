module Poppoya
  module Node
    class Node
      @io

      def initialize(id)
        p id
        @io = ServerSocket.new(id)
        @io.start
        loop do
          do_main
          sleep 1
          p Time.now
        end
      end

      def do_main
        @io.read
      end
    end
  end
end
