require 'socket'
require 'green_shoes'
require 'gtk2'
require 'benchmark'
SIZE=1024*1024*10
server = TCPServer.new('127.0.0.1',6001)
puts "Server listening..."
loop{

Thread.start(server.accept) do |client|
time=Benchmark.realtime do
Shoes.app(:title=>"TCP-File Share",:width => 400, :height => 600, :resizable => false ) do
 
caption "File Path:"
  @filename = edit_line

  
 def ask_save_file path = nil
    dialog_chooser "Save File...", Gtk::FileChooser::ACTION_SAVE, Gtk::Stock::SAVE, path
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
 
button "Save", :width => 85 do
   @file = ask_save_file
   
     @filename.text = @file
    File.open(@file, "w+") do |f|
      while chunk=client.read(SIZE)      
      @file = f.write(chunk)
       end  
    end
end

end

		
end


end
}



