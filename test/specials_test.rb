require "minitest/autorun"
require "minitest/pride"
require "./lib/specials"

class SpecialsTest < Minitest::Test
  def test_specials_exists
    specials = Specials.new(coffee)

    assert specials
  end

  def test_buy_one_get_one
    specials_1 = Specials.new(Array.new(1, coffee))
    specials_2 = Specials.new(Array.new(2, coffee))
    specials_3 = Specials.new(Array.new(3, coffee))
    specials_4 = Specials.new(Array.new(4, coffee))

    specials_1.buy_one_get_one
    specials_2.buy_one_get_one
    specials_3.buy_one_get_one
    specials_4.buy_one_get_one

    assert_equal coffee, specials_1.cart.last
    assert_equal bogo,   specials_2.cart.last
    assert_equal coffee, specials_3.cart.last
    assert_equal bogo,   specials_4.cart.last
  end

  def test_apple
    specials_1 = Specials.new(Array.new(1, apple))
    specials_2 = Specials.new(Array.new(2, apple))
    specials_3 = Specials.new(Array.new(3, apple))
    specials_4 = Specials.new(Array.new(4, apple))

    specials_1.apple
    specials_2.apple
    specials_3.apple
    specials_4.apple

    assert_equal 0, code_count(specials_1.cart, :APPL)
    assert_equal 0, code_count(specials_2.cart, :APPL)
    assert_equal 3, code_count(specials_3.cart, :APPL)
    assert_equal 4, code_count(specials_4.cart, :APPL)
  end

  def test_chai_and_milk
    specials_1 = Specials.new([chai])
    specials_2 = Specials.new([milk])
    specials_3 = Specials.new([chai, milk, apple])
    specials_4 = Specials.new([apple, milk, chai])
    specials_5 = Specials.new([milk, chai, milk, chai])

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

  def apple
    {code: :AP1, type: :product}
  end

  def coffee
    {code: :CF1, type: :product}
  end

  def chai
    {code: :CH1, type: :product}
  end

  def milk
    {code: :MK1, type: :product}
  end

  def bogo
    {code: :BOGO, type: :special}
  end

  def chmk
    {code: :BOGO, type: :special}
  end

  def code_count(cart, code)
    cart.count{ |item| item[:code] == code }
  end

  def code_index(cart, code)
    cart.find_index{ |item| item[:code] == :CHMK }
  end
end