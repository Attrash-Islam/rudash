require_relative '../lib/rudash'
require 'test/unit'

class PickTest < Test::Unit::TestCase
  def test_simple_hash
    hash = { a: 1, b: 2 }
    picked = R_.pick(hash, 'a')
    assert_equal picked, a: 1

    picked_arr = R_.pick(hash, ['a'])
    assert_equal picked_arr, a: 1
  end

  def test_not_exist_hash_path
    hash = { a: 1, b: 2 }
    picked = R_.pick(hash, ['a', 'b', 'x.y'])
    assert_equal picked, a: 1, b: 2
  end

  def test_pick_hash_with_array_path
    hash = { a: 1, b: 2, c: [2] }
    picked = R_.pick(hash, ['b', 'c'])
    assert_equal picked, b: 2, c: [2]
  end

  def test_create_complex_hash_with_array_path
    hash = { a: 1, b: 2, c: { x: { y: [2, 1] } } }
    picked = R_.pick(hash, ['c.x.y[0]', 'a'])
    assert_equal picked, a: 1, c: { x: { y: [2] } }

    picked2 = R_.pick(hash, ['c.x.y[0]', 'c.x.y[1]', 'a'])
    assert_equal picked2, a: 1, c: { x: { y: [2, 1] } }
  end

  def test_array
    array = [1, 2, 3]
    picked_item = R_.pick(array, ['1'])
    assert_equal picked_item, {}
  end
end
