Shoes.app(:title=>"TCP-File Share",:width => 400, :height => 600, :resizable => false ) do
 
require 'socket'
SIZE=1024*1024*10
host = 'localhost'
port = 6001
 TCPSocket.open(host, port) do |socket|

stack :margin_left => 5, :margin_right => 10, :width => 1.0, :height => 200, :scroll => true do

@box = edit_box :width => 1.0, :height => 400, :text =>'Welcome...!'
button "Open", :width => 75 do
    @file = ask_open_file
    @box.text = File.read(@file)
    @filename.text = @file
  end
end
end
end
