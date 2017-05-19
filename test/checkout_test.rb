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

    ch1 = checkout.item_codes.find(:CH1)

    assert_equal ch1.name, 'Chai'
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

  def test_total_one_item
    checkout = Checkout.new

    checkout.scan(:CH1)

    assert_equal 3.11, checkout.total
  end

  def test_total_two_items
    checkout = Checkout.new

    checkout.scan(:CH1)
    checkout.scan(:CH1)

    assert_equal 6.22, checkout.total
  end

  def test_apples_without_special
    checkout = Checkout.new

    checkout.scan(:AP1)
    checkout.scan(:AP1)

    assert_equal 12.00, checkout.total
  end

  def test_apples_with_special
    checkout = Checkout.new

    checkout.scan(:AP1)
    checkout.scan(:AP1)
    checkout.scan(:AP1)

    assert_equal 13.50, checkout.total
  end

  def test_coffee_without_special
    checkout = Checkout.new

    checkout.scan(:CF1)

    assert_equal 11.23, checkout.total
  end

  def test_coffee_with_special
    checkout = Checkout.new

    checkout.scan(:CF1)
    checkout.scan(:CF1)

    assert_equal 11.23, checkout.total
  end

  def test_coffee_with_special_2
    checkout = Checkout.new

    checkout.scan(:CF1)
    checkout.scan(:CF1)
    checkout.scan(:CF1)

    assert_equal 22.46, checkout.total
  end

  def test_apples_with_coffee
    checkout = Checkout.new

    checkout.scan(:AP1)
    checkout.scan(:AP1)
    checkout.scan(:AP1)
    checkout.scan(:CF1)
    checkout.scan(:CF1)

    assert_equal 24.73, checkout.total
  end

  def test_chai_without_special
    checkout = Checkout.new

    checkout.scan(:CH1)

    assert_equal 3.11, checkout.total
  end

  def test_milk_without_special
    checkout = Checkout.new

    checkout.scan(:MK1)

    assert_equal 4.75, checkout.total
  end

  def test_chai_milk_with_special
    checkout = Checkout.new

    checkout.scan(:CH1)
    checkout.scan(:MK1)

    assert_equal 3.11, checkout.total
  end

  def test_chai_milk_with_apples
    checkout = Checkout.new

    checkout.scan(:AP1)
    checkout.scan(:AP1)
    checkout.scan(:AP1)
    checkout.scan(:CH1)
    checkout.scan(:MK1)

    assert_equal 16.61, checkout.total
  end

  def test_chai_milk_with_coffee
    checkout = Checkout.new

    checkout.scan(:CF1)
    checkout.scan(:CF1)
    checkout.scan(:CH1)
    checkout.scan(:MK1)

    assert_equal 14.34, checkout.total
  end

  def test_chai_milk_with_coffee_with_apples
    checkout = Checkout.new

    checkout.scan(:AP1)
    checkout.scan(:AP1)
    checkout.scan(:AP1)
    checkout.scan(:CF1)
    checkout.scan(:CF1)
    checkout.scan(:CH1)
    checkout.scan(:MK1)

    assert_equal 27.84, checkout.total
  end

  def test_given_set_1
    checkout = Checkout.new

    checkout.scan(:CH1)
    checkout.scan(:AP1)
    checkout.scan(:CF1)
    checkout.scan(:MK1)

    assert_equal 20.34, checkout.total
  end

  def test_given_set_2
    checkout = Checkout.new

    checkout.scan(:MK1)
    checkout.scan(:AP1)

    assert_equal 10.75, checkout.total
  end
end