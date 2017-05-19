require "./lib/specials"
require "./lib/products"
require 'pry'

class Checkout
  attr_reader :item_codes, :cart

  def initialize
    @item_codes = Products.new({
      CH1:  { name: 'Chai',            price: 3.11  },
      AP1:  { name: 'Apples',          price: 6.00  },
      CF1:  { name: 'Coffee',          price: 11.23 },
      MK1:  { name: 'Milk',            price: 4.75  },
      BOGO: { name: 'Buy One Get One', price: -11.23 },
      APPL: { name: 'Buy 3+ Apples',   price: -1.50  },
      CHMK: { name: 'Chai & Milk',     price: -4.75  },
    })
    @cart = []
  end

  def scan(item)
    cart << {code: item, type: :product} unless item_codes.find(item).nil?
  end

  def total
    specials = Specials.new(cart)
    specials.check_all
    specials.cart.reduce(0) do |sum, item|
      sum += @item_codes.find(item[:code]).price
    end.round(2)
  end
end
