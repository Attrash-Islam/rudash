require_relative '../lib/rudash'
require 'test/unit'

class NumberTest < Test::Unit::TestCase
  def test_number
    assert_equal R_.number?(543), true
  end

  def test_array
    assert_equal R_.number?([1, 2, 3]), false
  end

  def test_hash
    assert_equal R_.number?(a: 1), false
  end

  def test_float
    float_num = 1.5
    assert_equal R_.number?(float_num), true
  end
end
