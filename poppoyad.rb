#!/usr/bin/ruby
# coding: utf-8

require_relative 'lib/poppoya'

#nodes = [:sv1, :sv2]
nodes = [:sv1]

begin
  threads = Array.new
  nodes.each { |node|
    threads << Thread.start(node) { |node|
      Poppoya::Node::Node.new(node)
    }
  }

  threads.each { |t|
    t.join
  }
rescue Interrupt
  puts "interrupted."
end
