require 'socket'

server = TCPServer.open(6000)

loop {
  	Thread.start(server.accept) do |client|
	   
		file = open('/home/shivani/Desktop/Hello', "rb")
		fileContent = file.read
		client.puts(fileContent)
		client.close
end

}
