#!/usr/bin/env ruby

require_relative 'Gui'

if __FILE__ == $0

  # ARGV.each do|a|
    # puts "Argument: #{a}"
  # end

  require 'optparse'

  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: example.rb [options]"

    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
      options[:verbose] = v
    end
  end.parse!

  p options
  p ARGV

  g = Gui.new
  g.main

end
