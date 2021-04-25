#Author: Nicolas Dupuis, Ben Davies, Nathan Maroko, Ryan Rickerl
#Date: 4/19/2021
#Desc: Select and Parse a csv file
require 'csv'
require './Item'

class ReadCSV
    #CSV file to read our shopping cart or inventory should be with the following headers: name, price, quantity

    puts "Enter a filename for your csv: "
    filename = gets.chomp

    # Check file for existence and readability
    if File.exists?(filename)
        if ! File.readable?(filename)
            puts "ERROR:: file '#{filename}' is not readable. Exiting"
            exit
        end
    else
        puts "ERROR:: file '#{filename}' does not exist. Exiting"
        exit
    end

    # create variables to store the references to column indexes
    @nameIdx = nil
    @priceIdx = nil
    @quantityIdx = nil

    # read CSV file into an array
    data = CSV.read(filename)

    # feader
    colNames = data.shift()

    for i in 0..colNames.length
        colId = colNames[i].to_s            # convert to string for comparison

        if colId.casecmp?("name")           # ignorecase compare for "name"
            @nameIdx = i
        elsif colId.casecmp?("price")       # ignorecase compare for "price"
            @priceIdx = i
        elsif colId.casecmp?("quantity")    # ignorecase compare for "quantity"
            @quantityIdx = i
        end
    end

    if !(@nameIdx and @priceIdx and @quantityIdx)
        puts "The provided CSV file is formatted incorrectly."
        puts "Please include the following headers: name, price, quantity."
        exit
    end

    @itemList = []      # create an array to store the Items 

    for row in data
        name = row[@nameIdx]
        price = row[@priceIdx].to_f
        quantity = row[@quantityIdx].to_i

        item = Item.new(name, price, quantity)

        @itemList << item
    end
    
    # print itemList
    for item in @itemList
        puts item.toString
    end

#    #returns the total price of the item(s) as a string
#    def PrintFileData()
#        for i in 0..(itemList.length)
#            puts itemList[i].toString()
#        end
#    end
#
#    #aggregates the data from the file to combine duplicate items into a single field
#    def AggregateItems()
#        aggregatedItems = []
#
#        for i in 0..(itemList.length)
#            for j in 0..(itemList.length)
#                if((i != j) && (itemList[i].getName == itemList[j].getName))
#                    newQuantity = itemList[i].getQuantity + itemList[j].getQuantity
#                    newPrice = itemList[i].getPrice + itemList[j].getPrice
#                    newName = itemList[i].getName
#                    aggregatedItems << Item.initialize(newName, newPrice, newQuantity)
#                end
#            end
#        end
#    end
end
