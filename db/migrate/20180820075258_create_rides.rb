class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.time :checkout
      t.integer :passengers
      t.string :destination

      t.timestamps
    end
  end
end
