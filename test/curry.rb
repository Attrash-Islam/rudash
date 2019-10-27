require_relative '../lib/rudash'
require 'test/unit'

class CurryTest < Test::Unit::TestCase
  def test_curry
    inc = ->(a, b) { a + b }
    inc_by_one = R_.curry(inc).call(1)
    assert_equal inc_by_one[3], 4
  end

  def test_expected_proc_exception
    assert_raise do
      R_.curry({})
    end
  end
end
