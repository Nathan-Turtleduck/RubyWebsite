#!/usr/bin/ruby
#-------------------------------
# file: fruits.rb
# author(s): Ryan Rickerl
# date: 03 Apr 2021
#-------------------------------

# Hash of Arrays
fruits = {
    "apples" => ["red delicious", "granny smith", "fuji", "gala", "honeycrisp"],
    "oranges" => ["blood", "navel", "satsuma"],
    "berries" => ["huckleberry", "blackberry", "strawberry", "blueberry", "raspberry"]
}


for fruit in fruits.keys
    puts(fruit.upcase())
    print fruits[fruit].class, fruits[fruit], "\n"
    puts(fruits[fruit].sort)
    puts()
end
