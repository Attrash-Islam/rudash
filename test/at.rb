require_relative '../lib/rudash'
require 'test/unit'

class AtTest < Test::Unit::TestCase
  def test_sym_hash
    hash = { a: 1, b: 2 }
    assert_equal R_.at(hash, %w[a b]), [1, 2]
  end

  def test_string_hash
    hash = { 'a' => 1, 'b' => 2 }
    assert_equal R_.at(hash, %w[a b]), [1, 2]
  end

  def test_deep_path_in_hash
    hash = { a: { b: { c: 3 } } }
    assert_equal R_.at(hash, ['a.b', 'a.b.c']), [{ c: 3 }, 3]
  end
end
