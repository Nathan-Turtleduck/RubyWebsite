# file: PrintInventory.rb
# author(s): Ryan Rickerl
# date: 26 Apr 2021
# desc: Generates an inventory of 'Items' with a total worth
require './ReadCSV'

puts "Enter a filename for your inventory: "
filename = gets.chomp

csvFile = ReadCSV.new(filename)

# print a summary of the inventory
csvFile.printData
