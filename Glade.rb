#!/usr/bin/env ruby

require 'gtk3'

class Glade < Gtk::Builder
  def initialize gladeStruct, filename = true
    super()

    if filename
      fromFile gladeStruct
    else
      fromString gladeStruct
    end
  end

  def fromFile gladeFile
    self.add_from_file(gladeFile)
  end
  def fromString gladeString
    self.add_from_string(gladeString)
  end

  def destroy_handler rootObject = "window1"
    self[rootObject].signal_connect 'destroy' do
      Gtk.main_quit
    end
    self[rootObject].show_all
    self.connect_signals do | handler |
      method handler
    end
  end
end

if __FILE__ == $0

  builder = Glade.new("window1.glade")
  builder.destroy_handler
  Gtk.main

end
