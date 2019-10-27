require_relative '../lib/rudash'
require 'test/unit'

class UniqTest < Test::Unit::TestCase
  def test_nil
    assert_equal R_.uniq(nil), []
  end

  def test_number
    assert_equal R_.uniq(66), []
  end

  def test_hash
    assert_equal R_.uniq(a: 1), []
  end

  def test_array
    assert_equal R_.uniq([1, 2, 2, 3, 3, 3]), [1, 2, 3]
  end
end
