require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test 'generates a random number on create' do
    user = users(:one)
    order = Order.create(user_id: user.id)
    assert_not order.number.nil?
  end

  test 'number must be unique' do
    user = users( :one)
    order = Order.create(user_id: user.id)
    dup_order = order.dup

    assert_not dup_order.valid?
  end
end
