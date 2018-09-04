class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :rides, :checkout, :string
    add_column :rides, :departure_time, :datetime
  end
end
