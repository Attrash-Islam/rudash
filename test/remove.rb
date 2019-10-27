require_relative '../lib/rudash'
require 'test/unit'

class RemoveTest < Test::Unit::TestCase
  def test_nil
    assert_equal R_.remove(nil), []
  end

  def test_number
    assert_equal R_.remove(0), []
  end

  def test_remove_all
    array = [1, 2, 3, 4]
    removed_items = R_.remove(array)
    assert_equal removed_items, [1, 2, 3, 4]
    assert_equal array, []
  end

  def test_predicate
    array = [1, 2, 3, 4]
    is_even = ->(v) { v.even? }
    removed_items = R_.remove(array, is_even)
    assert_equal removed_items, [2, 4]
    assert_equal array, [1, 3]
  end

  def test_remove_hashes_by_hash
    persons = [
      { name: 'islam', sex: 'male' },
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]
    removed_persons = R_.remove(persons, sex: 'female')
    assert_equal removed_persons, [
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]

    assert_equal persons, [{ name: 'islam', sex: 'male' }]
  end
end
