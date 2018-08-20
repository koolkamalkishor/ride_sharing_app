class AddAuthorToInterests < ActiveRecord::Migration[5.2]
  def change
    add_reference :interests, :author, index: true
    add_foreign_key :interests, :users, column: :author_id
  end
end
