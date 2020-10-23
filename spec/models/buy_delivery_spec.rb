require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  before do
    @buy_delivery = FactoryBot.build(:buy_delivery)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it 'postal_codeとarea_idとcitiesとaddとphoneとtokenが存在すれば購入できる' do
        expect(@buy_delivery).to be_valid
      end
    end
    
    context '商品購入がうまくいかない時'do
      it 'postal_codeが空だと購入できない' do
        @buy_delivery.postal_code = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがにハイフンがないと購入できない' do
        @buy_delivery.postal_code = '1234567'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'area_idが1だと購入できない' do
        @buy_delivery.area_id = 1
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Area can't be blank")
      end
      it 'citiesが空だと購入できない' do
        @buy_delivery.cities = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Cities can't be blank")
      end
      it 'addが空だと購入できない' do
        @buy_delivery.add = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Add can't be blank")
      end
      it 'phoneが空だと購入できない' do
        @buy_delivery.phone = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが11文字以上だと購入できない' do
        @buy_delivery.phone = '123123412341'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phone is the wrong length (should be 11 characters)")
      end
      it 'phoneが全角文字だと購入できない' do
        @buy_delivery.phone = '１２３１２３４１２３４'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが空だと購入できない' do
        @buy_delivery.token = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end

    end

  end
end


# - ログアウト状態のユーザーが商品購入ページに遷移しようとすると、ログインページに遷移すること
# - ログイン状態の出品者が、URLを直接入力して自身の出品した商品購入ページに遷移しようとすると、トップページに遷移すること
# - ログイン・ログアウトの状態に関わらず、URLを直接入力して売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移すること
# - クレジットカード決済ができること
# - クレジットカードの情報は購入の都度入力させること
# - クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと
# - 配送先の住所情報も購入の都度入力させること
# - 配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
# - 郵便番号にはハイフンが必要であること（123-4567となる）
# - 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）
# - 購入が完了したら、トップページまたは購入完了ページに遷移すること
# - エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）
# - 入力に問題がある状態で購入ボタンが押されたら、購入ページに戻りエラーメッセージが表示されること
