require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(:password=>"password",:password_confirmation=>"password",:first_name=>"Jane", :last_name=>"Doe",:email=>"test@test.com")
    @user.save
  end 
  describe 'Validations' do
    it "the created user should be valid" do
      expect(@user).to be_valid
    end
    it "should check if a user has an invalid first_name" do
      @user.first_name =nil 
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "should check if a user has an invalid last_name" do
      @user.last_name =nil 
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "should check if a user has an invalid email" do
      @user.email =nil 
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "should check if a user has an invalid password" do
      @user.password =nil 
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "should check if a user has an invalid password_confirmation" do
      @user.password_confirmation =nil 
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    it "should check if emails are unique and are not case sensitive" do
      @user.save!
      @user1 = User.new(:password=>"lighthouse",:password_confirmation=>"lighthouse",:first_name=>"John", :last_name=>"Smith",:email=>"TEST@TEST.com")
      expect(@user1).to_not be_valid
    end
    it "should check if password and password confirmation do not match" do
      @user1 = User.new(:password=>"lighthouse",:password_confirmation=>"lighthous",:first_name=>"John", :last_name=>"Smith",:email=>"TEST@TEST.com")
      expect(@user1).to_not be_valid
    end
    it "should erase extra spaces in an email adress" do
      auth_user = User.authenticate_with_credentials("  test@test.com  ",@user.password)
      expect(auth_user.email).to eq("test@test.com")
    end
    it "should correct all case inconsistencies by making everything lower case" do
      auth_user = User.authenticate_with_credentials("TeSt@tEst.com",@user.password)
      expect(auth_user.email).to eq("test@test.com")
    end
  end

end
