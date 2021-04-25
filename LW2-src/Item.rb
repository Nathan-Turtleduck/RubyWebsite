# Author: Nathan Maroko
# Date: 4/15/2021
# Desc: Defines an Item object that stores a name,price, and quantity

class Item
  #@@numItems = 0 # class variable - can be accessed from all objects

  # Constructor method (uses initialize)
  def initialize(name, price, quantity)
    if quantity < 0 
      puts("ERROR:: quantity must be greater than 0. Exiting")
      exit
    end

    @name = name
    @price = price
    @quantity = quantity
  end

  # returns the total price of the item(s) as a string
  def getPrice()
    total = @price * @quantity
    totalString = "%0.2f" % [total]
  end

  # returns the numItems class variable
  def getItems()
    @@numItems
  end

  def getQuantity()
    @quantity
  end

  def setQuantity(quantity)
    @quantity = quantity
  end

  def getPrice()
    @price
  end

  def setPrice(price)
    @price = price
  end

  def getName()
    @name
  end

  def setName(name)
    @name = name
  end

  def toString()
    retString = sprintf("%4i : %-50s : %5.2f", @quantity, @name, @price)
  end  
  
  def compare(item)
      @name == item.name
  end
end
