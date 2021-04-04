#!/usr/bin/ruby
#-------------------------------
# file: sum.rb
# author(s): Ryan Rickerl
# date: 03 Apr 2021
#-------------------------------

def sum(seq)
    s = 0
    for n in seq
        s += n
    end
    puts s
end

seq = Array[5, 6, 1, 8, 3, 7]

sum(seq)
