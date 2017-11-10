Shoes.app(:title=>"TCP-File Share",:width => 400, :height => 600, :resizable => false ) do
 
require 'socket'
require 'benchmark'
SIZE=1024*1024*10
server = TCPServer.new('127.0.0.1',6001)
puts "Server listening..."
loop{

Thread.start(server.accept) do |client|
time=Benchmark.realtime do


stack :margin_left => 5, :margin_right => 10, :width => 1.0, :height => 200, :scroll => true do
	   
		
 button "Save", :width => 85 do
    file = ask_save_file
    File.open(file, "w+") do |f|
      @file.text = File.write(@box.text)
    end
end
                  
end
end
end

file_size=File.size(file)/1024/1024
puts "Time elapsed: #{time}.Transferred #{file_size}MB.Transfer per second: #{file_size/time}MB"and
exit

}
end



