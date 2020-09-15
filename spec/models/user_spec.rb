require 'rails_helper'


RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
   end
  describe "ユーザー管理機能実装" do
    context "ユーザー登録がうまくいく場合" do
      it "name,email,password,password,password_confirmationがあれば登録できる" do
        @user.valid?
        expect(@user).to be_valid
      end
      it "emailに@が入っていれば登録できる" do
        @user.email = "eee@eee"
        @user.valid?
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが一致すれば登録できる" do
        @user.password = "aaa999"
        @user.password_confirmation = "aaa999"
        @user.valid?
        expect(@user).to be_valid
      end
      it "passwordが6文字以上なら登録できる" do
        @user.password = "eee999"
        @user.password_confirmation = "eee999"
        @user.valid?
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合であれば登録できる" do
        @user.password = "eee999"
        @user.password_confirmation = "eee999"
        @user.valid?
        expect(@user).to be_valid
      end
    end
    context "ユーザー登録がうまくいかない場合" do
      it "nameがないと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailがないと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordがないと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordとpassword_confirmationが一致しない場合は登録できない" do
        @user.password = "aaa111"
        @user.password_confirmation = "111aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが英字のみだと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが数字飲みだと登録できない" do
        @user.password = "111111"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが６文字未満だと登録できない" do
        @user.password = "111aa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end
end
