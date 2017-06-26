require 'minitest/pride'
require 'minitest/autorun'

require_relative './balance_checker.rb'

class BalanceCheckTest < Minitest::Test
  def setup
    @b = BalanceCheck.new('')
  end

  def test_empty_string_is_balanced
    assert_equal "Success", @b.is_balanced?
  end

  def test_brackets_only_string_is_balanced
    @b.string = '[]'
    assert_equal "Success", @b.is_balanced?
  end

  def test_brackets_and_parens_is_balanced
    @b.string = '[()]'
    assert_equal "Success", @b.is_balanced?
  end

  def test_more_brackets_and_parens_is_balanced
    @b.string = '[({([])})]([]){}'
    assert_equal "Success", @b.is_balanced?
  end

  def test_brackets_and_parens_w_additional_characters_is_balanced
    @b.string = '[(1)]'
    assert_equal "Success", @b.is_balanced?
  end

  def test_just_other_chars_is_balanced
    @b.string = '123kmdskhdjskl'
    assert_equal "Success", @b.is_balanced?
  end

  def test_stress_test_just_other_chars_is_balanced
    start = Time.now
    @b.string = 'j1'*500_000
    @b.is_balanced?
    end_time = Time.now
    assert 3000 >= end_time - start
  end

  def test_stress_test_w_brackets_is_balanced
    start = Time.now
    @b.string = '[(1)h]'*125_000
    @b.is_balanced?
    end_time = Time.now
    assert 3000 >= end_time - start
  end

  def test_unbalanced_returns_position_number
    @b.string = '{'
    assert_equal 1, @b.is_balanced?
  end

  def test_unbalanced_multichar_returns_position_number
    @b.string = '{[}'
    assert_equal 3, @b.is_balanced?
  end

  def test_more_unbalanced_multichar_returns_position_number
    @b.string = 'foo(bar[i)'
    assert_equal 10, @b.is_balanced?
  end
end
