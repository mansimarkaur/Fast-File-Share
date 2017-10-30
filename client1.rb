require 'socket'

host = 'localhost'
port = 6000
sock = TCPSocket.open(host, port)

data = sock.read

destFile = File.open('/home/shivani/Desktop/Hello',"wb")
destFile.print data
destFile.close
