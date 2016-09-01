require 'rails_helper'

describe UsersController, :type => :controller do
  describe "non-admin user access" do
    before :each do
      @user = create(:user)
      sign_in @user
    end

    describe "GET #index" do
      it "collects users into @users" do
        user = create(:user)
        get :index
        expect(assigns(:users)).to match_array [@user, user]
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "GET #new" do
      it "denies access" do
        get :new
        expect(response).to redirect_to root_url
      end
    end

    describe "POST #create" do
      it "denies access" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to root_url
      end
    end
  end

  describe "GET #show" do
    before do
      @user = create(:user)
      @user2 = create(:user)
    end

    context "User is logged in" do
      before do
        sign_in @user
      end

      it "loads the correct user details" do
        get :show, id: @user.id
        expect(response.status).to eq 200
        expect(assigns(:user)).to eq @user
      end

      it "renders the :show template" do
        get :show, id: @user.id
        expect(response).to render_template :show
      end

      it "doesn't load the second user" do
        get :show, id: @user2.id
        expect(response.status).to eq 302
        expect(response).to redirect_to root_url
      end
    end

    context "no user is logged in" do
      it "redirects to login" do
        get :show, id: @user.id
        expect(response).to redirect_to root_url
      end
    end
  end

  describe "admin user access" do
    before :each do
      @admin = create(:admin)
      sign_in @admin
    end

    describe "GET #new" do
      context "only admin can add new user" do
        it "assigns a new User to @user" do
          get :new
          expect(assigns(:user)).to be_a_new(User)
        end

        it "renders the :new template" do
          get :new
          expect(response).to render_template :new
        end
      end
    end

    describe "POST #create" do
      before :each do
        @user = attributes_for(:user)
      end
      context "with valid attributes" do
        it "saves the new user in the database" do
          expect{
            post :create, user: attributes_for(:user)
          }.to change(User, :count).by(1)
        end

        it "redirects to users#show" do
          post :create, user: attributes_for(:user)
          expect(response).to redirect_to users_path
        end
      end

      context "with invalid attributes" do
        it "does not save the new user in the database" do
          expect{
            post :create, user: attributes_for(:invalid_user)
          }.not_to change(User, :count)
        end

        it "re-renders the :new template" do
          post :create, user: attributes_for(:invalid_user)
          expect(response).to render_template :new
        end
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @user = create(:user,
        first_name: "John",
        last_name: "Smith")
      sign_in @user
    end

    context "with valid attributes" do
      it "locates the requested @user" do
        patch :update, id: @user, user: attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end

      it "changes @user's attributes" do
        patch :update, id: @user,
          user: attributes_for(:user,
          first_name: "Jack",
          last_name: "Black")
        @user.reload
        expect(@user.first_name).to eq("Jack")
        expect(@user.last_name).to eq("Black")
      end

      it "redirects to the updated user" do
        patch :update, id: @user, user: attributes_for(:user)
        expect(response).to redirect_to @user
      end
    end

  end

  describe "DELETE #destroy" do
    before :each do
      @user = create(:user)
      sign_in @user
    end

    it "deletes the user" do
      expect{
        delete :destroy, id: @user
      }.to change(User, :count).by(-1)
    end

    it "redirects to users#index" do
      delete :destroy, id: @user
      expect(response).to redirect_to users_url
    end
  end
end
