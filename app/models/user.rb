class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  with_options presence: true do
    validates :first_name, format: {
      with: /\A[ぁ-んァ-ン一-龥]/,
      message: '全角のみで入力して下さい'
    }
    validates :last_name, format: {
      with: /\A[ぁ-んァ-ン一-龥]/,
      message: '全角のみで入力して下さい'
    }
    validates :first_name_kana, format: {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
      message: '全角カタカナのみで入力して下さい'
    }
    validates :last_name_kana, format: {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
      message: '全角カタカナのみで入力して下さい'
    }
    validates :nickname
    validates :first_name_kana
    validates :born
  end
end
