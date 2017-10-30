<<<<<<< HEAD
require 'socket'
  

hostname= 'localhost'
port=2017

socket=TCPSocket.open(hostname,port)

while line=socket.gets

   puts line.chomp

  end

socket.close


||||||| merged common ancestors
=======
require 'socket'


server =TCPServer.open(2017)

loop{

    client=server.accept
    client.puts "Hello.This Is Socket Program."
    client.close
   }
>>>>>>> First_Commit1
