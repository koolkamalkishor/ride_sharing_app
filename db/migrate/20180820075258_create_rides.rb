class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :checkout
      t.integer :passengers
      t.string :destination

      t.timestamps
    end
  end
end
