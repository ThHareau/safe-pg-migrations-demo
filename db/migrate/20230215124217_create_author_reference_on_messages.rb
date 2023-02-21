class CreateAuthorReferenceOnMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :author, foreign_key: true
  end
end
