class AddPriceToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :price, :decimal, null: false
  end
end
