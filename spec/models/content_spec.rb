require 'rails_helper'

RSpec.describe Content, type: :model do
  before do
    @content = FactoryBot.build(:content)
    @content.image = fixture_file_upload('app/assets/images/sample_image.JPG')
  end
  describe "生き物の登録" do
    context "登録できる場合" do
      it "写真と名前と種類があれば登録できる" do
        @content.valid?
        expect(@content).to be_valid
      end
      it "場所が空でも登録できる" do
        @content.place = ""
        @content.valid?
        expect(@content).to be_valid
      end
      it "メモが空でも登録できる" do
        @content.memo = ""
        @content.valid?
        expect(@content).to be_valid
      end
      it "日にちが空でも登録できる" do
        @content.date = ""
        @content.valid?
        expect(@content).to be_valid
      end
    end
    context "登録できない場合" do
      it "写真がない場合は登録できない" do
        @content.image = nil
        @content.valid?
        expect(@content.errors.full_messages).to include "Image can't be blank"
      end
      it "名前がない場合は登録できない" do
        @content.name = ""
        @content.valid?
        expect(@content.errors.full_messages).to include "Name can't be blank"
      end
      it "種類が選択されていない場合は登録できない" do
        @content.kind_id = ""
        @content.valid?
        expect(@content.errors.full_messages).to include "Kind can't be blank"
      end
    end
  end
end
