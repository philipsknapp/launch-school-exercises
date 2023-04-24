require 'simplecov'
require 'minitest/autorun'

SimpleCov.start

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @reg = CashRegister.new(0)
    @trans1 = Transaction.new(25)
    @trans1.amount_paid = 10
    @trans2 = Transaction.new(50)
    @trans2.amount_paid = -0.5
    @trans3 = Transaction.new(9.99)
    @trans3.amount_paid = 10_000
  end
  
  def test_accept_money
    assert_equal(0, @reg.total_money)
    @reg.accept_money(@trans1)
    assert_equal(10, @reg.total_money)
    @reg.accept_money(@trans2)
    assert_in_delta(9.5, @reg.total_money)
  end
  
  def test_change
    assert_equal (-15), @reg.change(@trans1)
    assert_in_delta (-50.5), @reg.change(@trans2)
    assert_in_delta 9_990.01, @reg.change(@trans3)
  end
  
  def test_give_receipt
    assert_output("You've paid $50.\n", nil) { @reg.give_receipt(@trans2) }
    assert_output("You've paid $9.99.\n", nil) { @reg.give_receipt(@trans3) }
  end
end