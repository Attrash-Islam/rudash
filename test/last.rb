require_relative '../lib/rudash'
require 'test/unit'

class LastTest < Test::Unit::TestCase
  def test_regular_array
    result = R_.last([1, 2, 3])
    assert_equal result, 3
  end

  def test_empty_array
    result = R_.last([])
    assert_equal result, nil
  end

  def test_hash
    result = R_.last(a: 1)
    assert_equal result, nil
  end

  def test_nil
    result = R_.last(nil)
    assert_equal result, nil
  end
end
