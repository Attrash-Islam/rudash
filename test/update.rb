require_relative '../lib/rudash'
require 'test/unit'

class UpdateTest < Test::Unit::TestCase
  def test_default_updater
    hash = { a: 1 }
    R_.update(hash, 'a')
    assert_equal hash, { a: 1 }
  end
  
  def test_updater_not_proc
    hash = { a: 1 }
    R_.update(hash, 'a', 65)
    assert_equal hash, { a: 1 }
  end
  
  def test_update_on_hash_and_arrays
    hash = { a: [{ b: { c: 3 } }] }
    manipulate_self = -> (n) { n * n }
    R_.update(hash, 'a[0].b.c', manipulate_self)
    assert_equal hash, { a: [{ b: { c: 9 } }] }
  end
  
  def test_updater_no_args
    hash = { a: [{ b: { c: 3 } }] }
    manipulate_self = -> () { 1 }
    R_.update(hash, 'a[0].b.c', manipulate_self)
    assert_equal hash, { a: [{ b: { c: 1 } }] }
  end
  
  def test_not_exist_path
    hash = { a: [{ b: { c: 3 } }] }
    
    add_one_if_exist_else_zero = -> (n) {
      n.nil? ? 0 : n + 1
    }
    
    R_.update(hash, 'x[0].y.z', add_one_if_exist_else_zero)
    assert_equal hash, { a: [{ b: { c: 3 } }], x: [{ y: { z: 0 }}] }
  end
end
