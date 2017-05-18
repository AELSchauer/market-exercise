require "minitest/autorun"
require "minitest/pride"
require "./lib/specials"

class SpecialsTest < Minitest::Test
  def test_specials_exists
    specials = Specials.new([:A])

    assert specials
    assert_equal specials.cart[0], :A
  end

  def test_bogo
    specials_1 = Specials.new(Array.new(1, :CF1))
    specials_2 = Specials.new(Array.new(2, :CF1))
    specials_3 = Specials.new(Array.new(3, :CF1))
    specials_4 = Specials.new(Array.new(4, :CF1))

    specials_1.BOGO
    specials_2.BOGO
    specials_3.BOGO
    specials_4.BOGO

    assert_equal [:CF1],                                 specials_1.cart
    assert_equal [:CF1, :CF1, :BOGO],                    specials_2.cart
    assert_equal [:CF1, :CF1, :BOGO, :CF1],              specials_3.cart
    assert_equal [:CF1, :CF1, :BOGO, :CF1, :CF1, :BOGO], specials_4.cart
  end
end