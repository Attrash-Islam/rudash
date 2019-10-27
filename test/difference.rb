require_relative '../lib/rudash'
require 'test/unit'

class DifferenceTest < Test::Unit::TestCase
  def test_one_array
    arr1 = [1, 2, 3]
    assert_equal R_.difference(arr1), arr1
  end

  def test_one_array_with_other_types
    arr1 = [1, 2, 3]
    assert_equal R_.difference(arr1, 5), arr1
  end

  def test_numeric_arrays
    arr1 = [1, 2, 3]
    arr2 = [3]
    assert_equal R_.difference(arr1, arr2), [1, 2]
  end

  def test_three_arrays
    arr1 = [1, 2, 3]
    arr2 = [3]
    arr3 = [2]
    assert_equal R_.difference(arr1, arr2, arr3), [1]
  end
end
