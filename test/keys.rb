require_relative '../lib/rudash'
require 'test/unit'

class KeysTest < Test::Unit::TestCase
  def test_hash
    hash = { a: 1, b: 2 }
    assert_equal R_.keys(hash), ['a', 'b']
  end

  def test_complex_hash
    hash = { a: 1, b: { c: 3 } }
    assert_equal R_.keys(hash), ['a', 'b']
  end

  def test_nil
    assert_equal R_.keys(nil), []
  end

  def test_number
    assert_equal R_.keys(10), []
  end

  def test_array
    array = [1, 2, 3]
    assert_equal R_.keys(array), ['0', '1', '2']
  end
end
