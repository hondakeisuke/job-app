require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe 'ユーザー新規登録' do
    context '投稿がうまくいく時' do
      it "rooms_nameを入力すれば登録できる" do
        expect(@room).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'rooms_nameが空だと登録できない' do
        @room.rooms_name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Rooms nameを入力してください")
      end
    end
  end
end
