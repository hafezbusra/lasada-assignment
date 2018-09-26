require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @product = Product.new(
      title: "Paul Reed Smith Paul's Guitar 2013",
      brand: "PRS",
      model: "Paul Reed Smith Paul's Guitar",
      description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
      condition: "Excellent",
      finish: "Red",
      price: 999.10,
      quantity: 0,
      user_id: 3
    )
  end

  test "New product with all correct data" do
    assert @product.valid?
  end

  test "New product without title" do 	  
    @product.title = nil
    assert @product.valid?, 'saved product without title'
  end

  test "New product without brand" do    
    @product.brand = nil
    assert @product.valid?, 'saved product without brand'
  end

  test "New product without model" do    
    @product.model = nil
    assert @product.valid?, 'saved product without model'
  end

  test "New product without description" do    
    @product.description = nil
    assert @product.valid?, 'saved product without description'
  end

  test "New product without condition" do    
    @product.condition = nil
    assert @product.valid?, 'saved product without condition'
  end

  test "New product without finish" do    
    @product.finish = nil
    assert @product.valid?, 'saved product without finish'
  end

  test "New product without price" do    
    @product.price = nil
    assert @product.valid?, 'saved product without price'
  end

  test "New product without quantity" do    
    @product.quantity = nil
    assert @product.valid?, 'saved product without quantity'
  end

  test "New product without user_id" do    
    @product.user_id = nil
    assert @product.valid?, 'saved product without user_id'
  end

  test "New product with valid min price" do    
    @product.price = 0.01
    assert @product.valid?, 'saved product with min price'
  end

  test "New product with valid max price" do    
    @product.price = 99999999.99
    assert @product.valid?, 'saved product with max price'
  end

  test "New product with invalid min price" do    
    @product.price = 0.00
    assert @product.valid?, 'saved product with invalid min price'
  end

  test "New product with invalid max price" do    
    @product.price = 10000000000.00
    assert @product.valid?, 'saved product with invalid max price'
  end

  test "New product with invalid format2 price" do    
    @product.price = "s"
    assert @product.valid?, 'saved product with invalid price'
  end

  test "New product with valid min quantity" do    
    @product.quantity = 0
    assert @product.valid?, 'saved product with min quantity'
  end

  test "New product with valid max quantity" do    
    @product.quantity = 9999999999
    assert @product.valid?, 'saved product with max quantity'
  end

  test "New product with invalid min quantity" do    
    @product.quantity = -1
    assert @product.valid?, 'saved product with invalid min quantity'
  end

  test "New product with invalid max quantity" do    
    @product.quantity = 10000000000
    assert @product.valid?, 'saved product with invalid max quantity'
  end

  test "New product with invalid format1 quantity" do    
    @product.quantity = 0.00
    assert @product.valid?, 'saved product with invalid quantity 1'
  end

  test "New product with invalid format2 quantity" do    
    @product.quantity = "s"
    assert @product.valid?, 'saved product with invalid quantity 2'
  end
end
