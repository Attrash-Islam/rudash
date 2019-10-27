require_relative '../lib/rudash'
require 'test/unit'

class TakeTest < Test::Unit::TestCase
  def test_array_no_args
    result = R_.take([1, 2, 3])
    assert_equal result, [1]
  end

  def test_array_negative_count
    result = R_.take([1, 2, 3], -5)
    assert_equal result, []
  end

  def test_array_postitive_count
    result = R_.take([1, 2, 3], 2)
    assert_equal result, [1, 2]
  end

  def test_empty_array
    result = R_.take([])
    assert_equal result, []
  end

  def test_hash
    result = R_.take(a: 1)
    assert_equal result, []
  end

  def test_nil
    result = R_.take(nil)
    assert_equal result, []
  end
end
