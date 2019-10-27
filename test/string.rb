require_relative '../lib/rudash'
require 'test/unit'

class StringTest < Test::Unit::TestCase
  def test_nil
    assert_equal R_.string?(nil), false
  end

  def test_numeric
    assert_equal R_.string?(0), false
  end

  def test_string
    assert_equal R_.string?('string'), true
  end

  def test_array
    assert_equal R_.string?(['s', 't', 'r']), false
  end
end
