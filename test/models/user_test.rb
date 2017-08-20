require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should allow setting name" do
    a = User.new
    a.name = "Adam"
    assert_equal "Adam", a.name
  end

  test "add_friend should work" do
    a = User.create! name: "a", email: "a@test.com", password: "test"
    b = User.create! name: "b", email: "b@test.com", password: "test"
    a.add_friend(b)
    assert_equal [b], a.friends
  end
end


