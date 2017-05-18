require "minitest/autorun"
require "minitest/pride"
require "./lib/specials"

class SpecialsTest < Minitest::Test
  def test_specials_exists
    specials = Specials.new({code: :CF1, type: :product})

    assert specials
  end

  def test_buy_one_get_one
    specials_1 = Specials.new(Array.new(1, {code: :CF1, type: :product}))
    specials_2 = Specials.new(Array.new(2, {code: :CF1, type: :product}))
    specials_3 = Specials.new(Array.new(3, {code: :CF1, type: :product}))
    specials_4 = Specials.new(Array.new(4, {code: :CF1, type: :product}))

    specials_1.buy_one_get_one
    specials_2.buy_one_get_one
    specials_3.buy_one_get_one
    specials_4.buy_one_get_one

    cf1 = {code: :CF1,  type: :product}
    bogo = {code: :BOGO, type: :special}

    assert_equal cf1,  specials_1.cart.last
    assert_equal bogo, specials_2.cart.last
    assert_equal cf1,  specials_3.cart.last
    assert_equal bogo, specials_4.cart.last
  end

  def test_apple
    specials_1 = Specials.new(Array.new(1, {code: :AP1, type: :product}))
    specials_2 = Specials.new(Array.new(2, {code: :AP1, type: :product}))
    specials_3 = Specials.new(Array.new(3, {code: :AP1, type: :product}))
    specials_4 = Specials.new(Array.new(4, {code: :AP1, type: :product}))

    specials_1.apple
    specials_2.apple
    specials_3.apple
    specials_4.apple

    assert_equal 0, specials_1.cart.count{ |item| item[:code] == :APPL }
    assert_equal 0, specials_2.cart.count{ |item| item[:code] == :APPL }
    assert_equal 3, specials_3.cart.count{ |item| item[:code] == :APPL }
    assert_equal 4, specials_4.cart.count{ |item| item[:code] == :APPL }
  end

  def test_
    
  end
end