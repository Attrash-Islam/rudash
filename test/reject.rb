require_relative '../lib/rudash'
require 'test/unit'

class RejectTest < Test::Unit::TestCase
  def test_reject_evens
    is_even = ->(value) { value.even? }
    result = R_.reject([1, 2, 3, 4], is_even)
    assert_equal result, [1, 3]
  end

  def test_reject_hashes_by_hash
    persons = [
      { name: 'islam', sex: 'male' },
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]
    result = R_.reject(persons, sex: 'female')
    assert_equal result, [
      { name: 'islam', sex: 'male' }
    ]
  end

  def test_reject_hashes_by_deep_hash
    persons = [
      { name: { first: 'islam', last: 'attrash' }, sex: 'male' },
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]

    result = R_.reject(persons, name: { first: 'islam' })
    assert_equal result, [
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]

    result2 = R_.reject(persons, name: { first: 'islamx' })
    assert_equal result2, [
      { name: { first: 'islam', last: 'attrash' }, sex: 'male' },
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]

    persons = [
      { name: { first: ['islam', 'i'], last: 'attrash' }, sex: 'male' },
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]

    result3 = R_.reject(persons, name: { first: ['i'] })
    assert_equal result3, [
      { name: 'sabel', sex: 'female' },
      { name: 'sonia', sex: 'female' }
    ]
  end

  def test_array_default_reject_proc
    result = R_.reject([1, 0, nil, { a: 1 }])
    assert_equal result, [nil]
  end

  def test_hash_default_reject_proc
    result = R_.reject(a: 1, b: nil)
    assert_equal result, [nil]
  end

  def test_hash_with_value_reject
    is_even = ->(v) { v.even? }
    result = R_.reject({ a: 1, b: 2, c: 3, d: 4 }, is_even)
    assert_equal result, [1, 3]
  end

  def test_hash_with_key_reject
    key_bigger_than_a = ->(_v, k) { k > :a }
    result = R_.reject({ a: 1, b: 2, c: 3, d: 4 }, key_bigger_than_a)
    assert_equal result, [1]
  end

  def test_no_collection
    result = R_.reject(1)
    assert_equal result, []
  end
end
