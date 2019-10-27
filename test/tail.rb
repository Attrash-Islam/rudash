require_relative '../lib/rudash'
require 'test/unit'

class TailTest < Test::Unit::TestCase
  def test_regular_array
    result = R_.tail([1, 2, 3])
    assert_equal result, [2, 3]
  end

  def test_empty_array
    result = R_.tail([])
    assert_equal result, []
  end

  def test_hash
    result = R_.tail(a: 1)
    assert_equal result, []
  end

  def test_nil
    result = R_.tail(nil)
    assert_equal result, []
  end
end
