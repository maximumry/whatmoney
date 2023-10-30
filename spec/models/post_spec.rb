require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '新規投稿できる場合'
      it '全ての項目が入力していて投稿できる場合' do
        expect(@post).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it 'assetが空の場合は投稿できない' do
        @post.asset = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Asset can't be blank")
      end
  end
end
