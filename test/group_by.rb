require_relative '../lib/rudash'
require 'test/unit'

class GroupByTest < Test::Unit::TestCase
  def test_without_iterator_fn
    collection = [6.1, 4.2, 6.3]
    expected = { 6.1 => [6.1], 4.2 => [4.2], 6.3 => [6.3] }

    assert_equal R_.group_by(collection), expected
  end

  def test_nil
    collection = [6.1, 4.2, 6.3]
    expected = { 6.1 => [6.1], 4.2 => [4.2], 6.3 => [6.3] }

    assert_equal R_.group_by(collection, nil), expected
  end

  def test_with_iterator_fn
    collection = [6.1, 4.2, 6.3]
    iterator = ->(value) { value.floor }
    expected = { 4 => [4.2], 6 => [6.1, 6.3] }

    assert_equal R_.group_by(collection, iterator), expected
  end

  def test_hash
    hash = { a: 6.1, b: 4.2, c: 6.3 }
    expected = { 6.1 => [6.1], 4.2 => [4.2], 6.3 => [6.3] }

    assert_equal R_.group_by(hash), expected
  end

  def test_hash_with_iterator
    hash = { a: 6.1, b: 4.2, c: 6.3 }
    iterator = ->(value) { value.floor }
    expected = { 4 => [4.2], 6 => [6.1, 6.3] }

    assert_equal R_.group_by(hash, iterator), expected
  end
end
