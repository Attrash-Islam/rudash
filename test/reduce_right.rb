require_relative '../lib/rudash'
require 'test/unit'

class ReduceRightTest < Test::Unit::TestCase
  def test_sum_reducer
    sumer = ->(acc, current) {
      acc + current
    }

    assert_equal R_.reduce_right([1, 2, 3, 4, 5], sumer), 15
  end

  def test_string_reduce
    joiner = ->(acc, current) {
      acc + ',' + current
    }

    assert_equal R_.reduce_right('islam', joiner), 'm,a,l,s,i'
  end

  def test_sum_hash_values
    hash = { a: 1, b: 2 }
    hash_sumer = ->(acc, current) { acc + current }
    result = R_.reduce_right(hash, hash_sumer, 0)

    assert_equal result, 3
  end
end
