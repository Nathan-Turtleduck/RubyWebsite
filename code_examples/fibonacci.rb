# file: fibonacci.rb
# author: Ryan Rickerl (ryanrickerl@u.boisestate.edu)
# date: 26 Apr 2021

# first number of seq
a = 0

# second number of seq
b = 1

puts "The Fibonacci series is:"

for i in 0..6
  puts a
  
  fn = a + b
  a = b
  b = fn
end
