require_relative '../lib/rudash'
require 'test/unit'

class EachTest < Test::Unit::TestCase
  def test_number
    assert_equal R_.each(5), 5
  end

  def test_nil
    assert_equal R_.each(nil), nil
  end

  def test_string
    assert_equal R_.each('islam'), 'islam'
  end

  def test_eacher_without_args
    array = [1, 2, 3]
    new_array = []
    eacher = -> { new_array << 'item' }
    R_.each(array, eacher)
    assert_equal new_array, ['item', 'item', 'item']
  end

  def test_array_values
    array = [1, 2, 3]
    new_array = []
    eacher = ->(value) { new_array << value }
    R_.each(array, eacher)
    assert_equal new_array, array
  end

  def test_array_indexes
    array = [1, 2, 3]
    new_array = []
    eacher = ->(_value, index) { new_array << index }
    R_.each(array, eacher)
    assert_equal new_array, [0, 1, 2]
  end

  def test_hash_values
    hash = { a: 1, b: 2 }
    sum = 0
    eacher = ->(value) { sum += value }
    R_.each(hash, eacher)
    assert_equal sum, 3
  end

  def test_hash_indexes
    hash = { a: 1, b: 2 }
    new_array = []
    eacher = ->(_value, key) { new_array << key }
    R_.each(hash, eacher)
    assert_equal new_array, [:a, :b]
  end

  def test_alias
    hash = { a: 1, b: 2 }
    sum = 0
    eacher = ->(value) { sum += value }
    R_.for_each(hash, eacher)
    assert_equal sum, 3
  end
end
