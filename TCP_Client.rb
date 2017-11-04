require 'socket'
SIZE=1024*1024*10
host = 'localhost'
port = 6001
 TCPSocket.open(host, port) do |socket|



File.open("/home/shivani/Desktop/Video/Video/Ruby1.mp4",'rb') do |file|

while chunk=file.read(SIZE)
socket.write(chunk)
end
end
end
