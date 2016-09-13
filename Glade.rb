#!/usr/bin/env ruby

require 'gtk3'

class Glade < Gtk::Builder
  def initialize gladeStruct, rootObject = "window1", filename = true
    super()

    if filename
      fromFile gladeStruct
    else
      fromString gladeStruct
    end

    self[rootObject].signal_connect('destroy') { Gtk.main_quit }
    self[rootObject].show_all
    self.connect_signals{ |handler| method(handler) }
  end
  def fromFile gladeFile
    self.add_from_file(gladeFile)
  end
  def fromString gladeString
    self.add_from_string(gladeString)
  end
end

if __FILE__ == $0

  builder = Glade.new("window1.glade")
  Gtk.main

end
