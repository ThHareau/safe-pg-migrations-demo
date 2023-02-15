class Message < ApplicationRecord
  belongs_to :author, optional: true

  accepts_nested_attributes_for :author
end
