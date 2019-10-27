require_relative '../lib/rudash'
require 'test/unit'

class MapTest < Test::Unit::TestCase
  def test_double_numbers
    double = ->(value) { value * 2 }
    result = R_.map([1, 2, 3], double)
    assert_equal result, [2, 4, 6]
  end

  def test_not_proc
    result = R_.map([1, 2, 3], 6)
    assert_equal result, [nil, nil, nil]
  end

  def test_double_even_indexes
    double_even_index = ->(value, index) {
      index.even? ? value * 2 : value
    }
    result = R_.map([1, 2, 3, 4, 5, 6, 7, 8, 9], double_even_index)
    assert_equal result, [2, 2, 6, 4, 10, 6, 14, 8, 18]
  end

  def test_hash_mapping
    inc_by_one = ->(value) { value + 1 }
    hash = { a: 1 }
    result = R_.map(hash, inc_by_one)
    assert_equal result, [2]
  end

  def test_string_mapping
    add_e_to_even_indexes = ->(value, index) {
      index.even? ? value + 'e' : value
    }
    result = R_.map('islam', add_e_to_even_indexes)
    assert_equal result, ['ie', 's', 'le', 'a', 'me']
  end
end
