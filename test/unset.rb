require_relative '../lib/rudash'
require 'test/unit'

class UnsetTest < Test::Unit::TestCase
  def test_simple_hash
    hash = { a: 1, b: 2 }

    assert R_.unset(hash, 'a'), 'expected property to be deleted'
    assert_equal({ b: 2 }, hash)
  end

  def test_unset_hash_path
    hash = { a: 1, b: 2, c: { x: { y: 2 } } }

    assert R_.unset(hash, 'c.x.y'), 'expected property to be deleted'
    assert_equal({ a: 1, b: 2, c: { x: {} } }, hash)
  end

  def test_unset_hash_path_with_path_that_does_not_exist
    hash = { a: 1, b: 2, c: { x: { y: 2 } } }

    assert !R_.unset(hash, 'c.x.y.z'), 'expected property to not be deleted'
    assert_equal({ a: 1, b: 2, c: { x: { y: 2 } } }, hash)
  end

  def test_unset_hash_with_array_path
    hash = { a: 1, b: 2, c: [1, 2, 3] }

    assert R_.unset(hash, 'c[1]'), 'expected property to be deleted'
    assert_equal({ a: 1, b: 2, c: [1, 3] }, hash)
  end

  def test_unset_hash_with_number
    hash = { 1 => 1, 2 => 4, 3 => 9 }

    assert R_.unset(hash, '2'), 'expected property to be deleted'
    assert_equal({ 1 => 1, 3 => 9 }, hash)
  end

  def test_unset_hash_with_array_path_that_does_not_exist
    hash = { a: 1, b: 2, c: [1, 2, 3] }

    assert !R_.unset(hash, 'c[4]'), 'expected property to not be deleted'
    assert_equal(hash, a: 1, b: 2, c: [1, 2, 3])
  end

  def test_unset_array
    array = [{ a: 1 }, { a: 2 }]

    assert R_.unset(array, '[1].a'), 'expected property to be deleted'
    assert_equal([{ a: 1 }, {}], array)
  end
end
