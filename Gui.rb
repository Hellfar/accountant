#!/usr/bin/env ruby

require_relative 'Glade'

class Gui < Glade
  def initialize fileStruct = "account.glade", filename = true
    super(fileStruct, "window1", filename)
  end
  def main
    Gtk.main
  end

  def append template = "grid0", parent = "box2"
    self[parent].add self[template]
  end
end

if __FILE__ == $0

  g = Gui.new
  g.append
  g.main

end
