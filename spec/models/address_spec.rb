require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "post-codeとprefecture_id、city、house_number、building_nameが存在すれば登録できる" do
        expect(@address).to be_valid
      end
      it "building_nameがなくても登録できる" do
        @address.building_name = nil
        expect(@address).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'post-codeが空だと登録できない' do
        @address.post_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Post codeを入力してください", "Post codeは不正な値です")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @address.post_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include('Post codeは不正な値です')
      end
      it '郵便番号が3桁の数字ハイフン4桁の数字じゃないと保存できないこと' do
        @address.post_code = '123-111'
        @address.valid?
        expect(@address.errors.full_messages).to include('Post codeは不正な値です')
      end
      it 'prefecture_idが空だと登録できない' do
        @address.prefecture_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefectureは数値で入力してください")
      end
      it 'prefecture_idが0だと登録できない' do
        @address.prefecture_id = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefectureは0以外の値にしてください")
      end
      it 'cityが空だと登録できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Cityを入力してください")
      end
      it 'house_numberが空だと登録できない' do
        @address.house_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("House numberを入力してください")
      end
    end
  end
end
