require "minitest/autorun"
require "minitest/pride"
require "./lib/specials"

class SpecialsTest < Minitest::Test
  def test_specials_exists
    specials = Specials.new([:A])

    assert specials
    assert_equal specials.cart[0], :A
  end
end