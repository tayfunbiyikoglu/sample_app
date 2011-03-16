require 'spec_helper'

describe User do
  before(:each) do
    @attr = {:name => "Example User" , :email =>"example@example.com" }
  end
  
  it "should create a new user with give attributes" do
    User.create!(@attr)
  end
  
  it "should require name" do
    @attr[:name] = ""
      User.new(@attr).should_not be_valid
  end
end
