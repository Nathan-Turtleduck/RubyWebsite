# file: ReadCSV.rb
# author: Nicolas Dupuis, Ben Davies, Nathan Maroko, Ryan Rickerl
# date: 4/19/2021
# desc: Select and Parse a csv file

require 'csv'
require './Item'

class ReadCSV
    #CSV file to read our shopping cart or inventory should be with the following headers: name, price, quantity
    def initialize(filename)
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

        @itemList = []

        readFile(filename)
    end

    def getData()
        return @itemList
    end

    def printData()
        printf "+------------------------------------------------------------+\n"
        printf "| Inventory list                                             |\n"
        printf "+-----------------------------------------------+----+-------+\n"

        item_count = 0
        items_warehoused = 0
        inventory_value = 0

        # print itemList
        for item in @itemList
            name = item.getName
            quantity = item.getQuantity
            price = item.getPrice

            printf "| %-45s | %2i | $%0.2f |\n", name, quantity, price

            item_count += 1
            items_warehoused += quantity
            inventory_value += quantity * price
        end

        printf "+-----------------------------------------------+----+-------+\n"
        printf "Total number of unique items in inventory: %i\n", item_count
        printf "Total number of items warehoused: %i\n", items_warehoused
        printf "Total value of inventory: $%0.2f\n", inventory_value
    end

    private
    def readFile(filename)
        @data = CSV.read(filename)

        # get the headers
        colNames = @data.shift()

        # create variables to store the references to column indexes
        nameIdx = nil
        priceIdx = nil
        quantityIdx = nil

        for i in 0..colNames.length
            colId = colNames[i].to_s            # convert to string for comparison

            if colId.casecmp?("name")           # ignorecase compare for "name"
                nameIdx = i
            elsif colId.casecmp?("price")       # ignorecase compare for "price"
                priceIdx = i
            elsif colId.casecmp?("quantity")    # ignorecase compare for "quantity"
                quantityIdx = i
            end
        end

        if !(nameIdx and priceIdx and quantityIdx)
            puts "The provided CSV file is formatted incorrectly."
            puts "Please include the following headers: name, price, quantity."
            exit
        end

        for row in @data
            name = row[nameIdx]
            price = row[priceIdx].to_f
            quantity = row[quantityIdx].to_i

            item = Item.new(name, price, quantity)

            @itemList.push(item)
        end
    end
end
