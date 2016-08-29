require 'rails_helper'

describe Product do

  context "when the product has comments" do
    before do
      @product = create(:product)
      @user = create(:user)
      @product.comments.create!(rating: 1, user: @user, body: "Bad")
      @product.comments.create!(rating: 3, user: @user, body: "Average")
      @product.comments.create!(rating: 5, user: @user, body: "Great")
    end

    it "returns the average raiting of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end

  context "when complete" do
    it "has a valid factory" do
      expect(build(:product)).to be_valid
    end
  end

  context "when not complete" do

    it "is invalid without a name" do
      expect(build(:product, name: nil)).to_not be_valid
    end

    it "is invalid without a unique name" do
      @product = create(:product, name: "FUJIFILM X30")
      expect(build(:product, name: "FUJIFILM X30")).to_not be_valid
    end

    it "is invalid without a description" do
      expect(build(:product, description: nil)).to_not be_valid
    end

    it "is invalid without an image" do
      expect(build(:product, image_url: nil)).to_not be_valid
    end

    it "is invalid without a color" do
      expect(build(:product, color: nil)).to_not be_valid
    end

    it "is invalid without a price" do
      expect(build(:product, price: nil)).to_not be_valid
    end

    it "is invalid with a negative price" do
      expect(build(:product, price: -3)).to_not be_valid
    end

  end
end
