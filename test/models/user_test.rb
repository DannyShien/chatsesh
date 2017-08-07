require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "shoud allow setting name" do
    a = User.new
    a.name = "Adam"
    assert_equal "Adam", a.name
  end
end
