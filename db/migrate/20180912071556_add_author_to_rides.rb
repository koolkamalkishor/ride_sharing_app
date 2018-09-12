class AddAuthorToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :author, index: true
    add_foreign_key :rides, :users, column: :author_id
  end
end
