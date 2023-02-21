class CreateAuthorReferenceOnMessages < ActiveRecord::Migration[7.0]
  def change
    old_value = query_value("SHOW statement_timeout")
    execute "SET statement_timeout TO '5s'"

    add_column :messages, :author_id, :bigint

    execute "SET statement_timeout TO '0s'"

    add_index :messages, :author_id, algorithm: :concurrently

    execute "SET statement_timeout TO '5s'"

    add_foreign_key :messages, :authors, validate: false

    execute "SET statement_timeout TO '0s'"

    validate_foreign_key :messages, :author

    execute "SET statement_timeout TO #{quote(old_value + "s")}"
  end
end
