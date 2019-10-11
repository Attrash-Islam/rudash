require_relative '../lib/rudash'
require 'test/unit'

class IncludesTest < Test::Unit::TestCase
  def test_strings
    array = ["a","b","c"]

    result = R_.includes?(array, "a")
    assert_equal result, true

    result = R_.includes?(array, "d")
    assert_equal result, false
  end

  def test_ints
    array = [1,2,3]

    result = R_.includes?(array, 1)
    assert_equal result, true

    result = R_.includes?(array, 4)
    assert_equal result, false
  end
end
