require_relative '../lib/rudash'
require 'test/unit'

class SomeTest < Test::Unit::TestCase
  def test_match_even_numbers
    is_even = ->(value) { value.even? }
    result = R_.some?([1, 2, 3, 4], is_even)
    assert_equal result, true
  end

  def test_mismatch_odd_numbers
    is_even = ->(value) { value.even? }
    result = R_.some?([1, 3, 5, 7], is_even)
    assert_equal result, false
  end

  def test_nil_params
    result = R_.some?([1, 3, 5, 7], nil)
    assert_equal result, true
  end

  def test_persons_hashes
    persons = [
      { name: 'islam', sex: 'male' },
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]

    result = R_.some?(persons, sex: 'male')
    assert_equal result, true
  end
end
