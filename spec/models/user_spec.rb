require 'spec_helper'

describe 'Users model' do
  before :each do
    @user = User.new(name: "Chris Siggs")
  end

  it 'does not accept without zipcode' do
    @user.save
    @user.should_not be_valid

  end

  it 'does save user if zipcode exists' do
    @user.zipcode = 12345
     @user.save
     @user.should be_valid
  end

  it 'accepts only integer zipcode' do
    @user.zipcode = "ABCDE"
    @user.save
    @user.should_not be_valid
  end
end
