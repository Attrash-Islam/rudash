require_relative '../lib/rudash'
require 'test/unit'

class EveryTest < Test::Unit::TestCase
  def test_mismatch_even_numbers
    is_even = ->(value) { value.even? }
    result = R_.every?([1, 2, 3, 4], is_even)
    assert_equal result, false
  end

  def test_match_odd_numbers
    is_odd = ->(value) { value.odd? }
    result = R_.every?([1, 3, 5, 7], is_odd)
    assert_equal result, true
  end

  def test_nil_params
    result = R_.every?([1, 3, 5, 7], nil)
    assert_equal result, true
  end

  def test_persons_hashes
    persons = [
      { name: 'islam', sex: 'male' },
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]

    result = R_.every?(persons, sex: 'male')
    assert_equal result, false
  end
end
