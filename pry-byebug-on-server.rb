# Based off http://rosettacode.org/wiki/Echo_server#Ruby
# client: `$ nc localhost 12345`

require "pry"
require 'socket'
server = TCPServer.new(12345)

while (connection = server.accept)
  Thread.new(connection) do |conn|
    port, host = conn.peeraddr[1,2]
    client = "#{host}:#{port}"
    puts "#{client} is connected"
    begin
      loop do
        line = conn.readline
        puts "#{client} says: #{line}"
        if line.include? 'debug'
          binding.pry
          conn.puts('')
        else
          conn.puts(line)
        end
      end
    rescue EOFError
      conn.close
      puts "#{client} has disconnected"
    end
  end
end
