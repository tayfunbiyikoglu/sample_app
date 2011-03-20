require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :name => "Example User" ,
      :email =>"example@example.com",
      :password => "foobar",
      :password_confirmation => "foobar",
      :salt => "deneme"
    }
  end
  
  it "should create a new user with give attributes" do
    User.create!(@attr)
  end
  
  it "should require name" do
    @attr[:name] = ""
      User.new(@attr).should_not be_valid
  end
  
  describe "Password_validations" do
    
    it "should require a password" do
      User.new(@attr.merge(:password => "")).should_not be_valid
    end
    
    it "should_require_a_matching_password_confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a"*5
      User.new(@attr.merge(:password => short, :password_confirmation => short)).should_not be_valid
    end
    
    it "should reject long passwords" do
          long = "a"*41
          User.new(@attr.merge(:password => long, :password_confirmation => long)).should_not be_valid
     end
    
  end
end
