require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new(:name=> "Shrub")
    @product = Product.new(:name=>"Test", :price_cents =>4500, :quantity=>1, :category=>@category)
  end 
  describe 'Validations' do
    it "the created product should be valid" do
      expect(@product).to be_valid
    end
    it "should check if a product has an invalid name" do
      @product.name =nil 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "should check if a product has an invalid quantity" do
      @product.quantity =nil 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "should check if a product has an invalid category" do
      @product.category =nil 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it "should check if a product has an invalid price" do
      @product.price_cents =nil 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")

    end
  end   
end
