class Specials
  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def check_all
    buy_one_get_one
    apple
    chai_and_milk
  end

  def buy_one_get_one
    bogo = false
    @cart.each_with_index do |item, i|
      if item == :CF1
        @cart.insert(i+1, :BOGO) if bogo
        bogo = !bogo
      end
    end
  end

  def apple
    count_apples = cart.count{ |item| item == :AP1 }
    if count_apples / 3 >= 1
      @cart = @cart.reduce([]) do |updated_cart, item|
        updated_cart << item
        updated_cart << :APPL if item == :AP1
        updated_cart
      end
    end
  end

  def chai_and_milk
    chai = false
    milk = false
    i = 0
    while i < @cart.length
      chai = true if cart[i] == :CH1
      milk = true if cart[i] == :MK1
      if chai && milk
        @cart.insert(i + 1, :CHMK)
        i = @cart.length
      end
      i += 1
    end
  end
end