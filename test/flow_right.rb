require_relative '../lib/rudash'
require 'test/unit'

class FlowRightTest < Test::Unit::TestCase
  def test_happy_flow_path
    square = ->(number) { number * number }
    double = ->(number) { number * 2 }
    composed = R_.flow_right([square, double])
    assert_equal 400, composed.call(10, 20)
  end

  def test_flow_flatten_args
    square = ->(number) { number * number }
    double = ->(number) { number * 2 }
    composed = R_.flow_right([square], double)
    assert_equal 400, composed.call(10, 20)
  end

  def test_hash
    hash = { a: 1 }
    set_path = ->(path, value) {
      -> { R_.update(hash, path, -> { value }) }
    }

    composed = R_.flow_right(
      [
        set_path.call('a', 5),
        set_path.call('b', b: 1),
        set_path.call('c', 'string')
      ]
    )

    composed.call
    expected = { a: 5, b: { b: 1 }, c: 'string' }
    assert_equal expected, hash
  end
end
