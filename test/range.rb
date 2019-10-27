require_relative '../lib/rudash'
require 'test/unit'

class RangeTest < Test::Unit::TestCase
  def test_no_args
    result = R_.range
    assert_equal result, []
  end

  def test_one_arg
    result = R_.range(4)
    assert_equal result, [0, 1, 2, 3]

    result2 = R_.range(0)
    assert_equal result2, []
  end

  def test_one_negative_arg
    result = R_.range(-4)
    assert_equal result, [0, -1, -2, -3]
  end

  def test_two_args
    result = R_.range(1, 5)
    assert_equal result, [1, 2, 3, 4]
  end

  def test_three_args
    result = R_.range(0, 20, 5)
    assert_equal result, [0, 5, 10, 15]

    result = R_.range(0, 20, 6)
    assert_equal result, [0, 6, 12, 18]

    result2 = R_.range(0, -4, -1)
    assert_equal result2, [0, -1, -2, -3]

    result3 = R_.range(1, 4, 0)
    assert_equal result3, [1, 1, 1]
  end

  def test_illegal_cases
    result = R_.range(1000, 505, 5)
    assert_equal result, []
  end
end
