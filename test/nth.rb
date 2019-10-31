require_relative '../lib/rudash'
require 'test/unit'

class NthTest < Test::Unit::TestCase
  def test_not_array_source
    assert_equal nil, R_.nth(nil)
    assert_equal nil, R_.nth(a: 1)
    assert_equal nil, R_.nth(5)
  end

  def test_array_without_index
    assert_equal 1, R_.nth([1, 2, 3, 4, 5])
  end

  def test_array_with_wrong_index
    assert_equal 1, R_.nth([1, 2, 3, 4, 5], a: 1)
    assert_equal 1, R_.nth([1, 2, 3, 4, 5], nil)
    assert_equal 1, R_.nth([1, 2, 3, 4, 5], 'islam')
  end

  def test_array_with_positive_index
    assert_equal 3, R_.nth([1, 2, 3, 4, 5], 2)
    assert_equal nil, R_.nth([1, 2, 3, 4, 5], 6)
  end

  def test_array_with_negative_index
    assert_equal 5, R_.nth([1, 2, 3, 4, 5], -1)
    assert_equal 3, R_.nth([1, 2, 3, 4, 5], -3)
  end
end
