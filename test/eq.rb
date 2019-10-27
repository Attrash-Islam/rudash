require_relative '../lib/rudash'
require 'test/unit'

class EqTest < Test::Unit::TestCase
  def test_strings
    str = 'hi'

    assert_equal R_.eq?(str, str), true
    assert_equal R_.eq?('hi', str), false
  end

  def test_numbers
    assert_equal R_.eq?(123, 123), true
  end

  def test_hashs
    hash1 = { a: 1 }
    assert_equal R_.eq?(hash1, hash1), true
    assert_equal R_.eq?(hash1, a: 1), false
  end

  def test_arrays
    array = [1, 2]
    assert_equal R_.eq?(array, array), true
    assert_equal R_.eq?(array, [1, 2]), false
  end
end
