class AddPointsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :points, :integer, default: 0
    add_column :users, :progress, :integer, default: 0
  end
end
