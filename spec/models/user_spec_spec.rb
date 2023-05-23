require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(:password=>"password",:password_confirmation=>"password",:first_name=>"Jane", :last_name=>"Doe",:email=>"test@test.com")
  end 
  describe 'Validations' do
    it "the created user should be valid" do
      expect(@user).to be_valid
    end
  end
end
