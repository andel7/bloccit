require 'rails_helper'

describe User do
  include TestFactories

  describe '#favorited(post)' do
    it "returns `nil` if the user has not favorited the post" do
      @post = associated_post
      @user = authenticated_user
      
      expect(@user.favorited(@post)).to eq(nil)
    end

    it "returns the appropriate favorite if it exists" do
      @post = associated_post
      @user = authenticated_user
      @user.favorites.create(post: @post)
      expect(@user.favorited(@post)).to_not eq(nil)
    end
  end
end