#!/usr/bin/env ruby

require_relative 'Glade'

class Gui
	def initialize templateStruct = "account.glade", filename = true
		builder = Glade.new(templateStruct)
		Gtk.main
	end
end

if __FILE__ == $0

	g = Gui.new

end
