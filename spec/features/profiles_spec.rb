require 'rails_helper'

describe "Visiting profiles" do 
  include TestFactories
  include Warden::Test::Helpers
  Warden.test_mode!

  before do 
    @user = authenticated_user
    @post = associated_post(user: @user)
    @comment = Comment.new(user: @user, body: "A Comment")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save
  end

  describe "not signed it" do
    it "shows profile" do
        visit user_path(@user)
        expect(current_path).to eq(user_path(@user))


        expect( page ).to have_content(@user.name)
        expect( page ).to have_content(@post.title)
        expect( page ).to have_content(@comment.body)

    end
  end

  

  describe "signed it" do

    before do
        @user = create(:user)
        login_as @user, scope: :user
      end

    it "shows profile" do

        visit user_path(@user)
      
        # visit root_path
        
        # within '.user-info' do
        #   click_link "Sign In"
        # end
        # fill_in 'Email', with: @user.email
        # fill_in 'Password', with: @user.password

        # within 'form' do
        #   click_button 'Sign in'
        # end
        # user = FactoryGirl.create(:user)

        # puts user.valid?
        # login_as(user,:scope => :user)
        # visit user_path(user)
        # expect(current_path).to eq(user_path(user))


        # expect( page ).to have_content(@user.name)
        # expect( page ).to have_content(@post.title)
        # expect( page ).to have_content(@comment.body)

    end
  end



end
  