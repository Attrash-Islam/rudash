require_relative '../lib/rudash'
require 'test/unit'

class DropRightTest < Test::Unit::TestCase
  def test_array_no_args
    result = R_.drop_right([1, 2, 3])
    assert_equal result, [1, 2]
  end

  def test_array_negative_count
    result = R_.drop_right([1, 2, 3], -5)
    assert_equal result, [1, 2, 3]
  end

  def test_array_postitive_count
    result = R_.drop_right([1, 2, 3], 2)
    assert_equal result, [1]
  end

  def test_empty_array
    result = R_.drop_right([])
    assert_equal result, []
  end

  def test_hash
    result = R_.drop_right(a: 1)
    assert_equal result, []
  end

  def test_nil
    result = R_.drop_right(nil)
    assert_equal result, []
  end
end
