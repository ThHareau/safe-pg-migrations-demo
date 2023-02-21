class CreateAuthorReferenceOnMessages < ActiveRecord::Migration[7.0]
  def change
    old_value = query_value("SHOW statement_timeout")
    execute "SET statement_timeout TO '5s'"

    add_column :messages, :author_id, :bigint

    add_index :messages, :author_id

    add_foreign_key :messages, :authors

    execute "SET statement_timeout TO #{quote(old_value + "s")}"
  end
end
