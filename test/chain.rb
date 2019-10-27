require_relative '../lib/rudash'
require 'test/unit'

class ChainTest < Test::Unit::TestCase
  def test_happy_path
    filter_even = ->(number) { number.even? }
    inc_by_one = ->(number) { number + 1 }
    result = R_.chain([1, 2, 3, 4])
               .filter(filter_even)
               .map(inc_by_one)
               .head
               .value
    assert_equal result, 3
  end

  def test_method_not_found
    assert_raise NameError do
      # headx is not a Rudash function to be chained
      R_.chain([1, 2, 3, 4]).headx.value
    end
  end
end
