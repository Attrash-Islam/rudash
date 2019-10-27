require_relative '../lib/rudash'
require 'test/unit'

class ReverseTest < Test::Unit::TestCase
  def test_array
    assert_equal R_.reverse([1, 2, 3]), [3, 2, 1]
  end

  def test_string
    assert_equal R_.reverse('islam'), 'malsi'
  end
end
