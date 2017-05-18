class Specials
  attr_accessor :cart

  def initialize(cart)
    @cart = cart
  end

  def BOGO
    bogo = false
    cart.each_with_index do |c, i|
      if c == :CF1
        cart.insert(i+1, :BOGO) if bogo
        bogo = !bogo
      end
    end
  end
end