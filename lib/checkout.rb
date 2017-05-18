require "./lib/specials"
require "./lib/products"

class Checkout
  attr_reader :products, :cart

  def initialize
    @products = Products.new({
      CH1: { name: 'Chai',   price: 3.11  },
      AP1: { name: 'Apples', price: 6.00  },
      CF1: { name: 'Coffee', price: 11.23 },
      MK1: { name: 'Milk',   price: 4.75  }
    })
    @cart = []
  end

  def scan(item)
    cart << item unless products.find(item).nil?
  end
end
