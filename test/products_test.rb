require "minitest/autorun"
require "minitest/pride"
require 'pry'
require "./lib/products"

class ProductsTest < Minitest::Test
  def test_products_exists
    products = Products.new({CF1: { name: 'Coffee', price: 11.23 }})

    assert products
  end

  def test_products_psudo_database
    products = Products.new({CF1: { name: 'Coffee', price: 11.23 }})

    cf1 = products.find(:CF1)

    assert_equal 'Coffee', cf1.name
    assert_equal 11.23, cf1.price
  end

  def test_products_code_invalid
    products = Products.new({CF1: { name: 'Coffee', price: 11.23 }})

    assert_nil products.find(:AP1)
  end
end