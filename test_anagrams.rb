require_relative "anagrams"
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
 
  def test_subword
    assert_equal(true, is_subword('tac', 'caty'))
    assert_equal(false, is_subword('tacc', 'caty'))
    assert_equal(true, is_subword('pie', 'pies'))
    assert_equal(true, is_subword('PIE', 'pIeS'))
  end
 
end