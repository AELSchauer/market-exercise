require "minitest/autorun"
require "minitest/pride"
require "./lib/checkout"

class CheckoutTest < Minitest::Test
  def test_checkout_exists
    checkout = Checkout.new

    assert checkout
  end

  def test_product_prices
    checkout = Checkout.new

    assert_equal checkout.products[:CH1][:name], 'Chai'
  end

  def test_scan_with_valid_item
    checkout = Checkout.new

    checkout.scan(:CH1)

    assert_equal checkout.cart.length, 1
    assert_equal checkout.cart[0], :CH1
  end

  def test_scan_with_valid_items
    checkout = Checkout.new

    checkout.scan(:CH1)
    checkout.scan(:CH1)

    assert_equal checkout.cart.length, 2
    assert_equal checkout.cart[1], :CH1
  end

  def test_scan_with_invalid_item
    checkout = Checkout.new

    checkout.scan(:CH2)

    assert_equal checkout.cart.length, 0
  end
end