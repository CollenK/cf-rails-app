require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)
      @product.comments.create!(rating: 1, user: @user, body: "Bad")
      @product.comments.create!(rating: 3, user: @user, body: "Average")
      @product.comments.create!(rating: 5, user: @user, body: "Great")
    end

    it "returns the average raiting of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end

  context "when the product has no name" do
    before do
      @product = Product.new(description: "Great camera!")
    end

    it "is an invalid product" do
      expect(@product).not_to be_valid
    end
  end
end
