require_relative '../lib/rudash'
require 'test/unit'

class IntersectionTest < Test::Unit::TestCase
  def test_nil
    assert_equal R_.intersection(nil), []
  end

  def test_number
    assert_equal R_.intersection(0), []
  end

  def test_arrays
    assert_equal R_.intersection([2, 1], [2, 3]), [2]
  end

  def test_arrays_2
    assert_equal R_.intersection([1, 2, 3], [1, 2], [2]), [2]
  end

  def test_arrays_with_mixed_types
    assert_equal R_.intersection([1, 2, 3], [1, 2], 2), []
  end
end
