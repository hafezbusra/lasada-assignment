require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(
      name: "John",
      email: "John@mail.com",
      password: "12345678"
    )
  end

  test "New user with all correct data" do
    assert @user.valid?
  end

  test "New user without name" do 	  
    @user.name = nil
    assert @user.valid?, 'user is without a name'
  end

  test "New user without email" do 	  
    @user.email = nil
    assert @user.valid?, 'user is without an email'
  end

  test "New user without pass" do 	  
    @user.password = nil
    assert @user.valid?, 'user is valid without a pass'
  end

  test "New user with invalid email" do 	  
    @user.email = "Johnmail.com"
    assert @user.valid?, 'user is with an invalid email'
  end

  test "New user with short pass" do 	  
    @user.password = "1234567"
    assert @user.valid?, 'user is with a pass that is too short'
  end
end
