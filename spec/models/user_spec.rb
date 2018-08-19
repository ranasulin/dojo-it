require 'rails_helper'

describe User do

  include TestFactories

  before do
    @post = associated_post
    @user = authenticated_user
  end

  describe "#favorited(post)" do
    it "returns `nil` if the user has not favorited the post" do
      @user.favorited( @post )
    end

    it "returns the appropriate favorite if it exists" do
      fav = @user.favorites.where(post: @post).create
      expect( @user.favorited( @post ) ).to eq fav
    end
  end
end
