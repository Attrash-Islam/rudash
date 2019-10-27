require_relative '../lib/rudash'
require 'test/unit'

class FindTest < Test::Unit::TestCase
  def test_match_even_numbers
    is_even = ->(value) { value.even? }
    result = R_.find([1, 2, 3, 4], is_even)
    assert_equal result, 2
  end

  def test_mismatch_odd_numbers
    is_even = ->(value) { value.even? }
    result = R_.find([1, 3, 5, 7], is_even)
    assert_equal result, nil
  end

  def test_nil_params
    result = R_.find([1, 3, 5, 7], nil)
    assert_equal result, 1
  end

  def test_persons_hashes
    persons = [
      { name: 'islam', sex: 'male' },
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]

    result = R_.find(persons, sex: 'female')
    assert_equal result, name: 'sabel', sex: 'female'
  end
end
