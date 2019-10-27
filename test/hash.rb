require_relative '../lib/rudash'
require 'test/unit'

class HashTest < Test::Unit::TestCase
  def test_number
    assert_equal R_.hash?(543), false
  end

  def test_array
    assert_equal R_.hash?([1, 2, 3]), false
  end

  def test_hash
    assert_equal R_.hash?(a: 1), true
  end

  def test_nil
    assert_equal R_.hash?(nil), false
  end
end
