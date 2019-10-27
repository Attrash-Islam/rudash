require_relative '../lib/rudash'
require 'test/unit'

class IdentityTest < Test::Unit::TestCase
  def test_one_arg
    assert_equal R_.identity(0), 0
  end

  def test_multi_arg
    assert_equal R_.identity(1, 2), 1
  end
end
