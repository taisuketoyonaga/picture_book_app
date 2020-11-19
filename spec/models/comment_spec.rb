require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe "コメントの内容の保存" do
    context "コメントが保存される場合" do
      it "コメントが空でなければ登録できる" do
        @comment.valid?
        expect(@comment).to be_valid
      end
    end
    context "コメントが保存されない場合" do
      it "コメントが空の場合は保存されない" do
        @comment.comment = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Comment can't be blank"
      end
    end
  end
end
