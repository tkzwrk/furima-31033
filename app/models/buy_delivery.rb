class BuyDelivery
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :area_id, :cities, :add, :bill_name, :phone, :token, :buy_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, length: { maximum: 8 }
    validates :cities
    validates :add
    validates :token
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone, format: { with: /\d{9,11}/ }, length: { is: 11 }
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, cities: cities, add: add, bill_name: bill_name, phone: phone, area_id: area_id, buy_id: buy.id)
  end
end
