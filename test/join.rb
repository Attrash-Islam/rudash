require_relative '../lib/rudash'
require 'test/unit'

class JoinTest < Test::Unit::TestCase
  def test_nil
    assert_equal R_.join(nil), ''
  end

  def test_number
    assert_equal R_.join(0), ''
  end

  def test_array_default_sep
    assert_equal R_.join([1, 2, 3]), '1,2,3'
  end

  def test_array_numeric_sep
    assert_equal R_.join([1, 2, 3], 5), '15253'
  end

  def test_array_char_sep
    assert_equal R_.join([1, 2, 3], '*'), '1*2*3'
  end
end
