class CreateAuthorReferenceOnMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :author_id, :bigint

    add_index :messages, :author_id

    add_foreign_key :messages, :authors
  end
end
