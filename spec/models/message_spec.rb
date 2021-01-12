require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe 'メッサージ投稿' do
    context '投稿がうまくいくとき' do
      it "全ての項目を入力すれば登録できる" do
        expect(@message).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'contentが空だと登録できない' do
        @message.content = ''
        @message.valid?
        expect(@message.errors.full_messages).to include("Contentを入力してください")
      end
      it 'roomが紐付いていないと保存できないこと' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Roomを入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end