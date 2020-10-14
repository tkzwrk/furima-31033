class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true,format: {
    with: /\A[ぁ-んァ-ン一-龥]/,
    message: "全角のみで入力して下さい"
  }
  validates :last_name, presence: true,format: {
    with: /\A[ぁ-んァ-ン一-龥]/,
    message: "全角のみで入力して下さい"
  }
  validates :first_name_kana, presence: true,format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :last_name_kana, presence: true,format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :born, presence: true
end

# 以下はバリデーションを書く必要なし
# メールアドレスが必須であること
# メールアドレスは、@を含む必要があること
# パスワードが必須であること
# パスワードは、6文字以上での入力が必須であること
# パスワードとパスワード（確認用）、値の一致が必須であること

