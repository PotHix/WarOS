#!/usr/bin/env ruby

def require_file file
  require "#{File.expand_path(File.dirname(__FILE__))}/#{file}"
end

require_file "/lib/warOS"

window = WarOS.new
window.show
