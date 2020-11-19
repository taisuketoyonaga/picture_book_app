require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "ユーザー新規登録ができる場合" do
      it "正しいユーザー情報を登録すれば新規登録できてトップページへ遷移する" do
        # トップページに遷移する
        visit root_path
        # サインアップのボタンがある事を確認する
        expect(page).to have_content "新規登録" 
        # 新規登録ページに遷移する
        visit  new_user_registration_path
        # ユーザー情報を入力する
        fill_in 'Name', with: @user.name
        fill_in 'Email',with: @user.email
        fill_in 'Password',with: @user.password
        fill_in 'Password confirmation',with: @user.password_confirmation
         # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
         expect{find('input[name="commit"]').click}.to change {User.count}.by(1)
        # トップページへ遷移する
        expect(current_path).to eq root_path
        # カーソルを合わせるとログアウトボタンが表示されることを確認する
        expect(page).to have_content "自分の図鑑を見る"
        expect(page).to have_content "ログアウト"
        # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
        expect(page).to have_no_content "ログイン"
        expect(page).to have_no_content "新規登録"
      end
    end
    context "ユーザ登録ができない場合" do
      it "ユーザー情報を正しく登録しなければ登録できない" do
        # トップページに遷移する
        visit root_path
        # サインアップのボタンがある事を確認する
        expect(page).to have_content ('新規登録')
        # 新規登録ページに遷移する
        visit new_user_registration_path
        # ユーザー情報を登録する
        fill_in 'Name', with: ""
        fill_in 'Email', with: ""
        fill_in 'Password', with: ""
        fill_in 'Password confirmation', with: ""
        # サインアップボタンを押してもユーザーモデルのカウントが上がらない事を確認
        expect{find('input[name="commit"]').click}.to change {User.count}.by(0)
        # 新規登録ページに戻される事を確認する
        expect(current_path).to eq "/users"
       end
    end
  end

end
