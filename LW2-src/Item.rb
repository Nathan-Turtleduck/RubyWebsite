# file: Item.rb
# author: Nicolas Dupuis, Ben Davies, Nathan Maroko, Ryan Rickerl
# date: 4/15/2021
# desc: Defines an Item object that stores a name,price, and quantity

class Item
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

  def getQuantity()
    return @quantity
  end

  def setQuantity(quantity)
    @quantity = quantity
  end

  def getPrice()
    return @price
  end

  def setPrice(price)
    @price = price
  end

  def getName()
    return @name
  end

  def setName(name)
    @name = name
  end

  def toString()
    return sprintf("%4i : %-50s : %5.2f", @quantity, @name, @price)
  end  
  
  def compare(item)
      @name == item.name
  end
end
