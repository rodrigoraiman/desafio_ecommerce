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

  test 'adds products as order_items' do
    user = users( :one)
    order = Order.create(user_id: user.id)
    productos = products(:one)
    quantity = 1

    order.add_product( product_id, quantity)
    asstert_equal(order.order_items.count, 1)
  end
end
