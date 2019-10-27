require_relative '../lib/rudash'
require 'test/unit'

class CompactTest < Test::Unit::TestCase
  def test_no_nils
    result = R_.compact([1, 2, 3])
    assert_equal result, [1, 2, 3]
  end

  def test_with_nils
    result = R_.compact([1, 0, nil, 'islam'])
    assert_equal result, [1, 0, 'islam']
  end
end
