require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "ユーザー新規登録ができる場合" do
      it "正しいユーザー情報を登録すれば新規登録できてトップページへ遷移する" do
        visit root_path
        expect(page).to have_content "新規登録" 
        visit  new_user_registration_path
        fill_in 'Name', with: @user.name
        fill_in 'Email',with: @user.email
        fill_in 'Password',with: @user.password
        fill_in 'Password confirmation',with: @user.password_confirmation
         expect{find('input[name="commit"]').click}.to change {User.count}.by(1)
        expect(current_path).to eq root_path
        expect(page).to have_content "自分の図鑑を見る"
        expect(page).to have_content "ログアウト"
        expect(page).to have_no_content "ログイン"
        expect(page).to have_no_content "新規登録"
      end
    end
    context "ユーザ登録ができない場合" do
      it "ユーザー情報を正しく登録しなければ登録できない" do
        visit root_path
        expect(page).to have_content ('新規登録')
        visit new_user_registration_path
        fill_in 'Name', with: ""
        fill_in 'Email', with: ""
        fill_in 'Password', with: ""
        fill_in 'Password confirmation', with: ""
        expect{find('input[name="commit"]').click}.to change {User.count}.by(0)
        expect(current_path).to eq "/users"
       end
    end
  end
  describe "ログイン" , type: :system do
    before do
      @user = FactoryBot.create(:user)
    end
    context "ログインができる場合" do
      it "正しいユーザー情報を登録すればログインできて、トップページに遷移する" do
        sign_in(@user)
        expect(page).to have_no_content "ログイン"
        expect(page).to have_no_content "新規登録"
      end
    end
    context "ログインができない場合" do
      it "正しいユーザー情報を登録しなければ、ログインせずログインページに戻る" do
        visit root_path
        expect(page).to have_content "ログイン"
        visit new_user_session_path
        fill_in "Email", with: "aaa@aaa"
        fill_in "Password", with: "aaaaaaaa"
        find('input[name="commit"]').click
        expect(current_path).to eq new_user_session_path
        
      end
    end
  end
end
