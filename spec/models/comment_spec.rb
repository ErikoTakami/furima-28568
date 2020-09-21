require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    context 'コメントが投稿できるとき' do
      it 'コメントが入力されていれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントが投稿できないとき' do
      it 'コメントが入力されていないと投稿できない' do
        @comment.comment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
    end
  end
end
