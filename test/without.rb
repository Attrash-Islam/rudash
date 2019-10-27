require_relative '../lib/rudash'
require 'test/unit'

class WithoutTest < Test::Unit::TestCase
  def test_one_array
    arr1 = [1, 2, 3]
    assert_equal R_.without(arr1), arr1
  end

  def test_one_array_with_other_types
    arr1 = [1, 2, 3]
    assert_equal R_.without(arr1, 5), arr1
  end

  def test_numeric_arrays
    arr1 = [1, 2, 3]
    assert_equal R_.without(arr1, 3), [1, 2]
  end

  def test_three_arrays
    arr1 = [1, 2, 3]
    assert_equal R_.without(arr1, 3, 2), [1]
  end
end
