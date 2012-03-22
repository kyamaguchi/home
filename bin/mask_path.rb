#!/usr/bin/env ruby

File.open("#{ENV['HOME']}/.bash_history").readlines.each do |line|
  # Mask file and path including / OR .
  puts line.gsub(/[^\s]*[\/.][^\s]+/, 'X') # if line =~ /\|/
end
