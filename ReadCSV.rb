#Author: Nicolas Dupuis
#Date: 4/19/2021
#Desc: Select and Parse a csv file
class ReadCSV

require "csv"

#CSV file to read our shopping cart or inventory should be with the following headers: name, price, quantity


arrayName = []  #create an array to store data Name
arrayPrice = []  #create an array to store data Price
arrayQuantity = []  #create an array to store data Quantity


CSV.foreach(("FILENAME.csv"), headers: true, col_sep: ",") do |row|  #iterate through each row of the csv file, ignoring the first line (headers:true) and using  "," as column separator
    arrayName << row[0]
    arrayPrice << row[1]
    arrayQuantity << row[2]
end


 #returns the total price of the item(s) as a string
  def PrintFileData()
 print arrayName
 print arrayPrice
 print arrayQuantity
  end

