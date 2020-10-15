class Item < ApplicationRecord
  # has_one    :buy
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :days_id
    validates :price,numericality: {
      only_integer: true, 
      greater_than_or_equal_to: 300, 
      less_than_or_equal_to: 9999999
    },
    format:{
      with: /\A[0-9]+\z/
    }
    validates :image
  end
end

