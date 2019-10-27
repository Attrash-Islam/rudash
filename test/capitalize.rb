require_relative '../lib/rudash'
require 'test/unit'

class CapitalizeTest < Test::Unit::TestCase
  def test_nil
    assert_equal R_.capitalize(nil), ''
  end

  def test_number
    assert_equal R_.capitalize(4), '4'
  end

  def test_lowercase
    assert_equal R_.capitalize('fiverr'), 'Fiverr'
  end

  def test_uppercase
    assert_equal R_.capitalize('FIVERR'), 'Fiverr'
  end
end
