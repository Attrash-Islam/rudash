require_relative '../lib/rudash'
require 'test/unit'

class UnionTest < Test::Unit::TestCase
  def test_nil
    assert_equal R_.union(nil), []
  end

  def test_number
    assert_equal R_.union(0), []
  end

  def test_arrays
    assert_equal R_.union([2, 1], [2, 3]), [2, 1, 3]
  end

  def test_arrays_2
    assert_equal R_.union([1, 2, 3], [1, 2], [2]), [1, 2, 3]
  end

  def test_starting_no_array
    assert_equal R_.union(2, [1, 2, 3], [1, 2], 2), [1, 2, 3]
  end

  def test_arrays_of_hashes
    arr1 = [{ a: 1 }]
    arr2 = [{ a: 1 }]
    arr3 = [{ a: 1, b: 2 }]
    assert_equal R_.union(arr1, arr2, arr3), [{ a: 1 }, { a: 1, b: 2 }]
  end
end
