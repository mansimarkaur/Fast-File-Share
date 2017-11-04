require 'socket'
require 'benchmark'
SIZE=1024*1024*10
server = TCPServer.new('127.0.0.1',6001)
puts "Server listening..."
loop{

Thread.start(server.accept) do |client|
time=Benchmark.realtime do

	   
		File.open("Ruby1.mp4", "wb")   do |file|
                 while chunk=client.read(SIZE)
                   file.write(chunk)
                   end
                  
end
end
file_size=File.size("Ruby1.mp4")/1024/1024
puts "Time elapsed: #{time}.Transferred #{file_size}MB.Transfer per second: #{file_size/time}MB"and
exit
end
}



