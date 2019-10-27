require_relative '../lib/rudash'
require 'test/unit'

class SetTest < Test::Unit::TestCase
  def test_simple_hash
    hash = { a: 1, b: 2 }
    R_.set(hash, 'a', 2)
    assert_equal hash, a: 2, b: 2
  end

  def test_create_hash_path
    hash = { a: 1, b: 2 }
    R_.set(hash, 'c.x.y', 2)
    assert_equal hash, a: 1, b: 2, c: { x: { y: 2 } }
  end

  def test_create_hash_with_array_path
    hash = { a: 1, b: 2 }
    R_.set(hash, 'c[0]', 2)
    assert_equal hash, a: 1, b: 2, c: [2]
  end

  def test_create_complex_hash_with_array_path
    hash = { a: 1, b: 2 }
    R_.set(hash, 'c.x.y[0]', 2)
    R_.set(hash, 'c.x.y[1]', 1)
    assert_equal hash, a: 1, b: 2, c: { x: { y: [2, 1] } }
  end

  def test_override_values_if_exist
    hash = { a: 1, b: 2 }
    R_.set(hash, 'a.x', 'test')
    assert_equal hash, a: { x: 'test' }, b: 2

    hash = { a: 1, b: 2 }
    R_.set(hash, 'a.x[0]', 'test')
    assert_equal hash, a: { x: ['test'] }, b: 2
  end

  def test_array
    array = [1, 2, 3]
    R_.set(array, '0', 2)
    assert_equal array, [2, 2, 3]
    array = [{ a: 55 }]
    R_.set(array, '[0].a', 60)
    assert_equal array, [{ a: 60 }]
  end

  def test_deep_path_in_hash
    hash = { a: { b: { c: 3 } } }
    R_.set(hash, 'a.b.c', 7)
    assert_equal hash, a: { b: { c: 7 } }
  end

  def test_complex_hash_and_array
    hash = { a: { b: { c: [{ a: 1 }] } } }
    R_.set(hash, 'a.b.c.0.a', 'x')
    assert_equal hash, a: { b: { c: [{ a: 'x' }] } }
  end

  def test_not_hash_nor_array
    fake_hash = 5
    assert_equal R_.set(fake_hash, 'a.b', 'val'), 5
  end
end
