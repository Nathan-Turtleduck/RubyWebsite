#Author: Nicolas Dupuis, Ben Davies, Nathan Maroko, Ryan Rickerl
#Date: 4/19/2021
#Desc: Select and Parse a csv file
require "csv"

class ReadCSV
    #CSV file to read our shopping cart or inventory should be with the following headers: name, price, quantity
    

   #puts "Enter a filename for your csv: "
   #filename = gets
    
    arrayItems = []      #create an array to store the Items 
    
    nameIdx = nil       #creates a variable that will hold an integer
    priceIdx = nil      #creates a variable that will hold an integer
    quantityIdx = nil   #creates a variable that will hold an integer

    data = CSV.read("data/grocery.csv")
    cols = data.shift()

    for i in 0..cols.length
        value = cols[i].to_s

        if value.casecmp?("name")
            @nameIdx = i
        elsif value.casecmp?("price")
            @priceIdx = i
        elsif value.casecmp?("quantity")
            @quantityIdx = i
        end
    end

    if !(@nameIdx and @priceIdx and @quantityIdx)
        puts "The provided CSV file is formatted incorrectly."
        puts "Please include the following headers: name, price, quantity."
        exit
    end

    puts "name: #@nameIdx\nprice: #@priceIdx\nquantity: #@quantityIdx"

    for row in data
        printf "[%i] name: %-50s  price: %5.2f    quantity: %5s\n", row[0], row[@nameIdx], row[@priceIdx], row[@quantityIdx]

        #arrayItems << Item.initialize(row[@nameIdx], row[@priceIdx], row[@quantiyIdx])
    end
    
#    #returns the total price of the item(s) as a string
#    def PrintFileData()
#        for i in 0..(arrayItems.length)
#            puts arrayItems[i].toString()
#        end
#    end
#
#    #aggregates the data from the file to combine duplicate items into a single field
#    def AggregateItems()
#        aggregatedItems = []
#
#        for i in 0..(arrayItems.length)
#            for j in 0..(arrayItems.length)
#                if((i != j) && (arrayItems[i].getName == arrayItems[j].getName))
#                    newQuantity = arrayItems[i].getQuantity + arrayItems[j].getQuantity
#                    newPrice = arrayItems[i].getPrice + arrayItems[j].getPrice
#                    newName = arrayItems[i].getName
#                    aggregatedItems << Item.initialize(newName, newPrice, newQuantity)
#                end
#            end
#        end
#    end
end
