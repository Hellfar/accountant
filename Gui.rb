#!/usr/bin/env ruby

require_relative 'Glade'

class Gui < Glade
  def initialize fileStruct = "account.glade", filename = true
    super(fileStruct, filename)

    self.destroy_handler "window-main1"

    self["button-addevent1"].signal_connect 'clicked' do
      self.append "grid-template-constructed0", "box-eventpile1"
    end
  end
  def main
    Gtk.main
  end

  def append template, parent
    t = Glade.new "account.glade"

    self[parent].add t[template]
  end
end

if __FILE__ == $0

  g = Gui.new
  g.main

end
