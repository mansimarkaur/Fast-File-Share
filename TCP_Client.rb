require 'socket'
require 'green_shoes'
require 'gtk2'
SIZE=1024*1024*10
host = 'localhost'
port = 6001
TCPSocket.open(host, port) do |socket|

Shoes.app(:title=>"TCP-File Share",:width => 400, :height => 600, :resizable => false ) do
 
 
caption "File Path:"
  @filename = edit_line

 
 def ask_open_file path = nil
    dialog_chooser "Open File...", Gtk::FileChooser::ACTION_OPEN, Gtk::Stock::OPEN, path
  end
 def dialog_chooser title, action, button, path
    $dde = true
    dialog = Gtk::FileChooserDialog.new(
      title,
      get_win,
      action,
      nil,
      [Gtk::Stock::CANCEL, Gtk::Dialog::RESPONSE_CANCEL],
      [button, Gtk::Dialog::RESPONSE_ACCEPT]
    )
    dialog.current_folder = path if path
    ret = dialog.run == Gtk::Dialog::RESPONSE_ACCEPT ? dialog.filename : nil
    dialog.destroy
    ret
  end 
 def get_win
    Gtk::Window.new.tap do |s|
      s.icon = Gdk::Pixbuf.new File.join(DIR, '../static/gshoes-icon.png')
    end
  end
button "Open", :width => 75 do
    @file = ask_open_file
      
      @filename.text = @file
    while chunk=File.read( @file)
    socket.write(chunk)
    end

    
  
  end #for open button

   
end#for shoes

end
