require 'socket'
server=TCPSocket.open("127.0.0.1",3434)

while true
  puts "Enter file Name: "
  request=gets.chomp
  server.write(request)
  f=file.new("icon.xpm","wb")
  command=server.recv(200000)
  f.write(command)
  f.close
  puts"Check in Client directory..."
  
end

