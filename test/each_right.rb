require_relative '../lib/rudash'
require 'test/unit'

class EachTest < Test::Unit::TestCase
  def test_number
    assert_equal R_.each_right(5), 5
  end

  def test_nil
    assert_equal R_.each_right(nil), nil
  end

  def test_string
    assert_equal R_.each_right('islam'), 'islam'
  end

  def test_array_values
    array = [1, 2, 3]
    new_array = []
    eacher = ->(value) { new_array << value }
    R_.each_right(array, eacher)
    assert_equal new_array, [3, 2, 1]
  end

  def test_array_indexes
    array = [1, 2, 3]
    new_array = []
    eacher = ->(_value, index) { new_array << index }
    R_.each_right(array, eacher)
    assert_equal new_array, [0, 1, 2]
  end

  def test_hash_values
    hash = { a: 1, b: 2 }
    sum = 0
    eacher = ->(value) { sum += value }
    R_.each_right(hash, eacher)
    assert_equal sum, 3
  end

  def test_hash_indexes
    hash = { a: 1, b: 2 }
    new_array = []
    eacher = ->(_value, key) { new_array << key }
    R_.each_right(hash, eacher)
    assert_equal new_array, [:b, :a]
  end

  def test_alias
    hash = { a: 1, b: 2 }
    sum = 0
    eacher = ->(value) { sum += value }
    R_.for_each_right(hash, eacher)
    assert_equal sum, 3
  end
end
