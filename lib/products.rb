class Products
  Struct.new('Product', :name, :price)

  def initialize(product_hash)
    @product_hash = product_hash
  end

  def find(code)
    if @product_hash[code].nil?
      nil
    else
      Struct::Product.new(@product_hash[code][:name], @product_hash[code][:price])
    end
  end
end