#Author: Nathan Maroko
#Date: 4/15/2021
#Desc: Defines an Item object that stores a name,price, and quantity
class Item
  @@numItems = 0 #class variable - can be accessed from all objects

  #Constructor method (uses initialize)
  def initialize(name, price, quantity)
    if quantity > 0 
      @itemQuant = quantity
    else
      puts("Quantity must be greater than 0")
      exit
    end
    @itemName = name
    @itemPrice = price
    @@numItems += 1
  end

  #returns the total price of the item(s) as a string
  def getPrice()
    total = @itemPrice * @itemQuant
    totalString = "%0.2f" % [total]
  end

  #returns the numItems class variable
  def getItems()
    @@numItems
  end

  def getQuantity
    @itemQuant
  end

  def setQuantity(quantity)
    @itemQuant = quantity
  end

  def getPrice()
    @itemPrice
  end

  def setPrice(price)
    @itemPrice = price
  end

  def getName()
    @itemName
  end

  def setName(name)
    @itemName = name
  end

  def toString()
    retString = "#{@itemQuant} #{@itemName}(s) at $#{@itemPrice}"
  end  

end
