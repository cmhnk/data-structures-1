require 'minitest/pride'
require 'minitest/autorun'

require_relative './1.rb'

class BalanceCheckTest < Minitest::Test
  def setup
    @b = BalanceCheck.new('')
  end

  def test_empty_string_is_balanced
    assert @b.is_balanced?
  end
end
