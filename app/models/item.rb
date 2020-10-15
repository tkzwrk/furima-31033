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
    validates :price
  end
end

# 以下未実装バリデーション 
# 画像一枚つけること
# 価格の範囲300から9999999
# 価格は半角英数字のみ