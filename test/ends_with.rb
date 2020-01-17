require_relative '../lib/rudash'
require 'test/unit'

class EndsWithTest < Test::Unit::TestCase
  def test_true_string
    assert_equal R_.ends_with?('islam', 'am'), true
  end

  def test_false_string
    assert_equal R_.ends_with?('islam', 'xyz'), false
  end

  def test_string_numeric_suffix_type
    assert_equal R_.ends_with?('islam1', 1), true
  end

  def test_string_less_params
    assert_equal R_.ends_with?('islam'), false
  end

  def test_number
    assert_equal R_.ends_with?(543), false
  end

  def test_full_array
    assert_equal R_.ends_with?([1, 2, 3]), false
  end

  def test_empty_array
    assert_equal R_.ends_with?([]), false
  end

  def test_hash
    assert_equal R_.ends_with?(a: 1), false
  end

  def test_empty_hash
    assert_equal R_.ends_with?({}), false
  end

  def test_nil
    assert_equal R_.ends_with?(nil), false
  end
end
