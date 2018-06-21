require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
  	product = Product.new(title: "dd", description: "dasd", url: "zzz.jpg")
  	product.price = -1
  	assert product.invalid?
  	assert_equal ["must be gretaer than 0"], product.errors[:price]
  end
end
