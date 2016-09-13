#!/usr/bin/env ruby

require_relative 'Glade'

class Gui < Glade
  def initialize fileStruct = "account.glade", filename = true
    super(fileStruct, "window-main1", filename, true)

    self["button-addevent1"].signal_connect "clicked" do
      self.append
    end
  end
  def main
    Gtk.main
  end

  def append template = "grid-template-constructed0", parent = "box-eventpile1"
    t = Glade.new "account.glade", nil, true, false

    self[parent].add t[template]
  end
end

if __FILE__ == $0

  g = Gui.new
  g.main

end
