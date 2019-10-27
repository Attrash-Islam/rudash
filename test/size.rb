require_relative '../lib/rudash'
require 'test/unit'

class SizeTest < Test::Unit::TestCase
  def test_array
    assert_equal R_.size([1, 2, 3]), 3
  end

  def test_nil
    assert_equal R_.size(nil), 0
  end

  def test_hash
    assert_equal R_.size(a: 1, b: 2), 2
  end

  def test_string
    assert_equal R_.size('pebbles'), 7
  end
end
