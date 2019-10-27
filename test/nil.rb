require_relative '../lib/rudash'
require 'test/unit'

class NilTest < Test::Unit::TestCase
  def test_nil
    assert_equal R_.nil?(nil), true
  end

  def test_not_nil
    assert_equal R_.nil?(0), false
  end
end
