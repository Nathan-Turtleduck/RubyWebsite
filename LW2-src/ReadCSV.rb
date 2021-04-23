#Author: Nicolas Dupuis, Ben Davies, Nathan Maroko, Ryan Rickerl
#Date: 4/19/2021
#Desc: Select and Parse a csv file
class ReadCSV

    require "csv"
    
    #CSV file to read our shopping cart or inventory should be with the following headers: name, price, quantity
    

   #puts "Enter a filename for your csv: "
   #filename = gets
    
    arrayItems = []      #create an array to store the Items 
    
    nameIndex = -1       #creates a variable that will hold an integer
    priceIndex = -1      #creates a variable that will hold an integer
    quantityIndex = -1   #creates a variable that will hold an integer

    headers = CSV.parse(File.read(".grocery.csv")) #creates an array from the header line of the CSV
    puts "this is what we are printing: " 
    puts headers

    for i in 0..(headers.length) 
        if((headers[i].downcase! == "name") && (nameIndex == -1))
            nameIndex = i
        end
        if((headers[i].downcase! == "price") && (priceIndex == -1))
            priceIndex = i
        end
        if((headers[i].downcase! == "quantity") && (quantityIndex == -1))
            quantityIndex = i
        end

    end

    if((nameIndex == -1) || (priceIndex == -1) || (quantityIndex == -1))
        puts "The provided CSV file is formatted incorrectly."
        puts "Please include the following headers: name, price, quantity."
        exit
    end

    CSV.foreach(("grocery.csv"), headers: true, col_sep: ",") do |row|  #iterate through each row of the csv file, ignoring the first line (headers:true) and using  "," as column separato

        arrayItems << Item.initialize(row[1], row[2], row[3])
        
    end
    
    
     #returns the total price of the item(s) as a string
    def PrintFileData()
        for i in 0..(arrayItems.length)
            puts arrayItems[i].toString()
        end
    end

    #aggregates the data from the file to combine duplicate items into a single field
    def AggregateItems()
        aggregatedItems = []

        for i in 0..(arrayItems.length)
            for j in 0..(arrayItems.length)
                if((i != j) && (arrayItems[i].getName == arrayItems[j].getName))
                    newQuantity = arrayItems[i].getQuantity + arrayItems[j].getQuantity
                    newPrice = arrayItems[i].getPrice + arrayItems[j].getPrice
                    newName = arrayItems[i].getName
                    aggregatedItems << Item.initialize(newName, newPrice, newQuantity)
                end
            end
        end
    end
end
