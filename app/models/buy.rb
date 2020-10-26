class Buy < ApplicationRecord
  has_one :deliverys
  belongs_to :user
  belongs_to :item
end
