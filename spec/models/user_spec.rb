require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、bornが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'hogehogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角のみで入力して下さい')
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角のみで入力して下さい')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角のみで入力して下さい')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
      end
      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
      end
      it 'first_name_kanaが全角平仮名漢字では登録できない' do
        @user.first_name_kana = 'あ亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい')
      end
      it 'last_name_kanaが半角では登録できない' do
        @user.last_name_kana = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい')
      end
      it 'last_name_kanaが全角平仮名漢字では登録できない' do
        @user.last_name_kana = 'あ亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい')
      end
      it 'bornが空では登録できない' do
        @user.born = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Born can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '11111a'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは、半角英数字混合（英語のみ×）での入力が必須であること' do
        @user.password = 'hogehogehoge'
        @user.password_confirmation = 'hogehogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは、半角英数字混合（数字のみ×）での入力が必須であること' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    end
  end
end
