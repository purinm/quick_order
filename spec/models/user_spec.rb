require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "user新規登録できる"do
    it '必要な情報を適切に入力すると、商品の出品ができること' do
      expect(@user).to be_valid
    end
  end
  

  describe "user新規登録できない"do
    it "nameが空では登録できない" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = nil
      @user.valid?
    end
    it "passwordが6文字未満では登録できない" do
      @user.password = "11111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが6文字以上では登録できる" do
      @user.password = 'aaaaaaa'
      @user.valid?
    end
    it "password:半角英数混合の入力が必須であること" do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は英数字混合で入力してください')
    end
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = 'a12345'
      @user.password_confirmation = 'a12346'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "メールアドレスは、@を含まないと登録できないこと"do
      @user.email= "aaa.aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "重複したemailが存在する場合登録できないこと"do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
