require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "New product No Data" do
  	product = product.new()
  	assert_not product.save, "Saved product without a title"
  end

  test "New product with Data" do 
  	  
  	product = product.new(id: 100,
  								title: "Paul Reed Smith Paul's Guitar 2013",
								brand: "PRS",
								model: "Paul Reed Smith Paul's Guitar",
								description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
								condition: "Excellent",
								finish: "Red",
								price: "999",
								image: Rails.root.join("app/assets/images/product1.jpg").open,
								user_id: 3)
  	assert_not product.save, "Saved product with a title"
  end
end
