require "minitest/autorun"
require "minitest/pride"
require "./lib/checkout"

class CheckoutTest < Minitest::Test
  def test_checkout_exists
    checkout = Checkout.new

    assert checkout
  end

  def test_assert_prices
    checkout = Checkout.new

    assert_equal checkout.products[:CH1][:name], 'Chai'
  end
end