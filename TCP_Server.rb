require 'socket'
server=TCPServer.new(3434)
request=" "
text=" "
loop{
  
  Thread.start(server.accept) do |client|
  while true do
    
        request=client.recv(2000).chomp
        file.open("icon.xpm","rb") do |inp1|
          while line=inp1.gets
            text+=line
          end
          client.send(text,0)
          inp1.close
        end
  end
  
  
  end 
  
}

