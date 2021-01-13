require 'rails_helper'

RSpec.describe Job, type: :model do
  before do
    @job = FactoryBot.build(:job)
  end
  describe '仕事の募集' do
    context '投稿がうまくいくとき' do
      it "全ての項目を入力すれば登録できる" do
        expect(@job).to be_valid
      end
      it "job_house_numberとbilding_nameがなくても登録できる" do
        @job.job_house_number = nil
        @job.building_name = nil
        expect(@job).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'order_titleが空だと登録できない' do
        @job.order_title = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Order titleを入力してください")
      end
      it 'order_detailが空だと登録できない' do
        @job.order_detail = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Order detailを入力してください")
      end
      it 'periodが空だと登録できない' do
        @job.period = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Periodを入力してください")
      end
      it 'order_priceが空だと登録できない' do
        @job.order_price = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Order priceを入力してください")
      end
      it 'category_idが空だと登録できない' do
        @job.category_id = nil
        @job.valid?
        expect(@job.errors.full_messages).to include("Categoryを入力してください")
      end
      it 'category_idが0だと登録できない' do
        @job.category_id = 0
        @job.valid?
        expect(@job.errors.full_messages).to include("Categoryは0以外の値にしてください")
      end

      it 'job_post_codeが空だと登録できない' do
        @job.job_post_code = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Job post codeを入力してください")
      end
      it 'pericutureが空だと登録できない' do
        @job.prefecture_id = nil
        @job.valid?
        expect(@job.errors.full_messages).to include("Prefectureを入力してください", "Prefectureは数値で入力してください")
      end
      it 'pericutureが0だと登録できない' do
        @job.prefecture_id = 0
        @job.valid?
        expect(@job.errors.full_messages).to include("Prefectureは0以外の値にしてください")
      end
      it 'job_cityが空だと登録できない' do
        @job.job_city = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Job cityを入力してください")
      end
    end
  end
end