require_relative '../lib/rudash'
require 'test/unit'

class GetTest < Test::Unit::TestCase
  def test_sym_hash
    hash = { a: 1, b: 2 }
    assert_equal R_.get(hash, 'a'), 1
    assert_equal R_.get(hash, 'b'), 2
    assert_equal R_.get(hash, 'b.sc.cd.cd.d'), nil
  end

  def test_string_hash
    hash = { 'a' => 1, 'b' => 2 }
    assert_equal R_.get(hash, 'a'), 1
    assert_equal R_.get(hash, 'b'), 2
  end

  def test_array
    array = [1, 2, 3]
    assert_equal R_.get(array, '0'), 1
    array = [{ 'a' => 55 }]
    assert_equal R_.get(array, '[0].a'), 55
  end

  def test_deep_path_in_hash
    hash = { a: { b: { c: 3 } } }
    assert_equal R_.get(hash, 'a.b'), c: 3
    assert_equal R_.get(hash, 'a.b.c'), 3
  end

  def test_complex_hash_and_array
    hash = { a: { b: { c: [{ a: 1 }] } } }
    assert_equal R_.get(hash, 'a.b.c.0.a'), 1
    assert_equal R_.get(hash, 'a.b.c[0].a'), 1

    array_path = ['a', 'b', 'c', '0', 'a']
    assert_equal R_.get(hash, array_path), 1
    assert_equal R_.get(hash, 'a.b.c.xvx.a'), nil
  end

  def test_not_hash_nor_array
    fake_hash = 5
    assert_equal R_.get(fake_hash, 'a.b'), nil
  end
end
