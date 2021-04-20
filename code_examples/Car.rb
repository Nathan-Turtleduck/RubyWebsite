class Car
  @@numCars = 0 #class variable - can be accessed from all objects

  #Constructor method (uses initialize)
  def initialize(make, model, year, price)
    if price > 0 
      @carPrice = price
    else
      puts("Price must be greater than 0")
      exit
    end
    @carMake = make
    @carModel = model
    @carYear = year
    @@numCars += 1
  end

  def getPrice()
    @carPrice
  end

  def calculatePayment(downpayment, months)
    retPayment = @carPrice - downpayment
    retPayment = retPayment / months
    retPayment.round(2)
  end
    

  def toString()
    retString = "#{@carYear} #{@carMake} #{@carModel} at $#{@carPrice}"
  end  

end

toyotaC = Car.new("Toyota","Corolla",2010, 15000.00)
puts(toyotaC.toString())
monthlyPayment = toyotaC.calculatePayment(5000,24)
puts("5000 down for a monthly payment of $#{monthlyPayment} for 24 months")
