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

  def append template, parent, fileStruct = nil
    fileStruct = @gladeStruct unless fileStruct

    template_glade = Glade.new fileStruct

    template_glade["button-delete0"].signal_connect 'clicked' do
      self[parent].remove template_glade[template]
      template_glade = nil
    end

    self[parent].add template_glade[template]
  end
end

if __FILE__ == $0

  g = Gui.new
  g.main

end
