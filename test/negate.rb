require_relative '../lib/rudash'
require 'test/unit'

class NegateTest < Test::Unit::TestCase
  def test_negate
    is_even = ->(value) { value.even? }
    is_odd = R_.negate(is_even)

    assert_equal is_even[2], true
    assert_equal is_even[1], false
    assert_equal is_odd[1], true

    assert_equal R_.filter([1, 2, 3, 4], is_odd), [1, 3]
  end

  def test_negate_not_function
    assert_raise do
      R_.negate(5)
    end
  end
end
