require "rails_helper"

describe CommentsController, :type => :controller do

  context "with invalid params" do
    before do
      @product = create(:product)
    end
    it "is invalid without body" do
      expect(build(:invalid_comment)).to_not be_valid
    end
  end

  before do
    @product = create(:product)
    @comment = build(:comment).attributes
  end

  context "with valid params" do

    before do
      @user = create(:user)
      sign_in @user
    end

    it "creates a new comment" do
      expect{
        post :create, {product_id: @product.id ,comment: @comment}
      }.to change(Comment,:count).by(1)
    end

    context "delete comment" do

      before do
        @user = create(:user)
        @created_comment = create(:comment)
        sign_in @user
      end

      it "deletes a comment" do
        expect{
          delete :destroy, {product_id: @product.id ,id: @created_comment.id}
        }.to change(Comment,:count).by(-1)
      end
    end
  end
end
