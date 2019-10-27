require_relative '../lib/rudash'
require 'test/unit'

class HeadTest < Test::Unit::TestCase
  def test_regular_array
    result = R_.first([1, 2, 3])
    assert_equal result, 1
  end

  def test_empty_array
    result = R_.first([])
    assert_equal result, nil
  end

  def test_hash
    result = R_.first(a: 1)
    assert_equal result, nil
  end

  def test_nil
    result = R_.first(nil)
    assert_equal result, nil
  end
end
