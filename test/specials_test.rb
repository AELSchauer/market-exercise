require "minitest/autorun"
require "minitest/pride"
require "./lib/specials"

class SpecialsTest < Minitest::Test
  def test_specials_exists
    specials = Specials.new(:CF1)

    assert specials
  end

  def test_buy_one_get_one
    specials_1 = Specials.new(Array.new(1, :CF1))
    specials_2 = Specials.new(Array.new(2, :CF1))
    specials_3 = Specials.new(Array.new(3, :CF1))
    specials_4 = Specials.new(Array.new(4, :CF1))

    specials_1.buy_one_get_one
    specials_2.buy_one_get_one
    specials_3.buy_one_get_one
    specials_4.buy_one_get_one

    assert_equal :CF1,  specials_1.cart.last
    assert_equal :BOGO, specials_2.cart.last
    assert_equal :CF1,  specials_3.cart.last
    assert_equal :BOGO, specials_4.cart.last
  end

  def test_apple
    specials_1 = Specials.new(Array.new(1, :AP1))
    specials_2 = Specials.new(Array.new(2, :AP1))
    specials_3 = Specials.new(Array.new(3, :AP1))
    specials_4 = Specials.new(Array.new(4, :AP1))

    specials_1.:AP1
    specials_2.:AP1
    specials_3.:AP1
    specials_4.:AP1

    assert_equal 0, code_count(specials_1.cart, :APPL)
    assert_equal 0, code_count(specials_2.cart, :APPL)
    assert_equal 3, code_count(specials_3.cart, :APPL)
    assert_equal 4, code_count(specials_4.cart, :APPL)
  end

  def test_chai_and_milk
    specials_1 = Specials.new([:CH1])
    specials_2 = Specials.new([:MK1])
    specials_3 = Specials.new([:CH1, :MK1, :AP1])
    specials_4 = Specials.new([:AP1, :MK1, :CH1])
    specials_5 = Specials.new([:MK1, :CH1, :MK1, :CH1])

    specials_1.chai_and_milk
    specials_2.chai_and_milk
    specials_3.chai_and_milk
    specials_4.chai_and_milk
    specials_5.chai_and_milk

    assert_equal 0, code_count(specials_1.cart, :CHMK)
    assert_equal 0, code_count(specials_2.cart, :CHMK)
    assert_equal 1, code_count(specials_3.cart, :CHMK)
    assert_equal 2, code_index(specials_3.cart, :CHMK)
    assert_equal 1, code_count(specials_4.cart, :CHMK)
    assert_equal 3, code_index(specials_4.cart, :CHMK)
    assert_equal 1, code_count(specials_5.cart, :CHMK)
    assert_equal 2, code_index(specials_5.cart, :CHMK)
  end

  def code_count(cart, code)
    cart.count{ |item| item[:code] == code }
  end

  def code_index(cart, code)
    cart.find_index{ |item| item[:code] == :CHMK }
  end
end