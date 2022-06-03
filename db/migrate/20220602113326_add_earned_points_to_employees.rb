class AddEarnedPointsToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :earned_points, :integer, default: 0, null: false
  end
end
