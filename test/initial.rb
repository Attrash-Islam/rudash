require_relative '../lib/rudash'
require 'test/unit'

class InitialTest < Test::Unit::TestCase
  def test_nil
    assert_equal R_.initial(nil), []
  end

  def test_array
    assert_equal R_.initial([1, 2, 3]), [1, 2]
  end

  def test_one_item_array
    assert_equal R_.initial([1]), []
  end
end
