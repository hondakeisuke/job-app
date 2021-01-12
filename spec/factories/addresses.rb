FactoryBot.define do
  factory :address do
    post_code       { '111-1111' }
    prefecture_id   { 3 }
    city            { 'テスト市' }
    house_number    { 'テスト1-1' }
    building_name   { 'テスト1' }
    association     :user
  end
end
