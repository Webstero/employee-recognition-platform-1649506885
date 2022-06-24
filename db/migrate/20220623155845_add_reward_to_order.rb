class AddRewardToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :bought_reward, :text
  end
end
