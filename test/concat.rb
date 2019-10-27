require_relative '../lib/rudash'
require 'test/unit'

class ConcatTest < Test::Unit::TestCase
  def test_concat_arrays
    result = R_.concat([1, 2, 3], [4])
    assert_equal result, [1, 2, 3, 4]
  end

  def test_one_array
    result = R_.concat([1, 2, 3])
    assert_equal result, [1, 2, 3]
  end

  def test_concat_multi_arrays
    result = R_.concat([1, 2, 3], [4], [5])
    assert_equal result, [1, 2, 3, 4, 5]
  end

  def test_concat_nil
    result = R_.concat([1, 2, 3], nil)
    assert_equal result, [1, 2, 3, nil]
  end

  def test_concat_objects
    result = R_.concat(1, a: 1)
    assert_equal result, [1, { a: 1 }]
  end
end
