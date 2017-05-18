class Specials
  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def check_all
    buy_one_get_one
    apple
    @cart
  end

  def buy_one_get_one
    bogo = false
    @cart.each_with_index do |item, i|
      if item[:code] == :CF1
        @cart.insert(i+1, {code: :BOGO, type: :special}) if bogo
        bogo = !bogo
      end
    end
  end

  def apple
    count_apples = cart.count{ |item| item[:code] == :AP1 }
    if count_apples / 3 >= 1
      @cart = @cart.reduce([]) do |updated_cart, item|
        updated_cart << item
        updated_cart << {code: :APPL, type: :special} if item[:code] == :AP1
        updated_cart
      end
    end
  end
end