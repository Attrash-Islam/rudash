require_relative '../lib/rudash'
require 'test/unit'

class FindLastTest < Test::Unit::TestCase
  def test_match_even_numbers
    is_even = ->(value) { value.even? }
    result = R_.find_last([1, 2, 3, 4], is_even)
    assert_equal result, 4
  end

  def test_mismatch_odd_numbers
    is_even = ->(value) { value.even? }
    result = R_.find_last([1, 3, 5, 7], is_even)
    assert_equal result, nil
  end

  def test_nil_params
    result = R_.find_last([1, 3, 5, 7], nil)
    assert_equal result, 7
  end

  def test_persons_hashes
    persons = [
      { name: 'islam', sex: 'male' },
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]

    result = R_.find_last(persons, sex: 'female')
    assert_equal result, name: 'sonia', sex: 'female'
  end
end
