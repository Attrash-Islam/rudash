require_relative '../lib/rudash'
require 'test/unit'

class SliceTest < Test::Unit::TestCase
  def test_not_array
    assert_equal R_.slice(a: 1), []
    assert_equal R_.slice(5), []
  end

  def test_array
    assert_equal R_.slice([1, 2, 3], 0, 2), [1, 2]
    assert_equal R_.slice([1, 2, 3], 1), [2, 3]
    assert_equal R_.slice([1, 2, 3], 1, 2), [2]
    assert_equal R_.slice([1, 2, 3, 4, 5, 6], 0, 3), [1, 2, 3]
    assert_equal R_.slice([1, 2, 3, 4, 5, 6], 2, 5), [3, 4, 5]
  end

  def test_string
    assert_equal R_.slice('islam', 0, 4), ['i', 's', 'l', 'a']
  end

  def test_end_bigger_than_array_size
    assert_equal R_.slice([1, 2, 3], 0, 353_533_534), [1, 2, 3]
    assert_equal R_.slice([1, 2, 3], 353_533_534), []
  end

  def test_wrong_inputs
    assert_equal R_.slice([1, 2, 3], 0, 's'), []
    assert_equal R_.slice([1, 2, 3], 's', 's'), []
  end
end
