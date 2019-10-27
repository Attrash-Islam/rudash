require_relative '../lib/rudash'
require 'test/unit'

class EqualTest < Test::Unit::TestCase
  def test_simple_hashes
    hash1 = { a: 1 }
    hash2 = { a: 1 }
    assert_equal R_.equal?(hash1, hash2), true
  end

  def test_complex_hashes
    hash1 = { a: { b: 2 } }
    hash2 = { a: { b: 2 } }
    assert_equal R_.equal?(hash1, hash2), true
  end

  def test_different_hashes
    hash1 = { a: { b: 2 } }
    hash2 = { a: { c: 2 } }
    assert_equal R_.equal?(hash1, hash2), false
  end
end
