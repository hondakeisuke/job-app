FactoryBot.define do
  factory :job do
    order_title       { 'test' }
    order_detail      { 'test' }
    period            { 'test' }
    order_price       { 'test' }
    category_id       { 1 }
    job_post_code     { 'test' }
    prefecture_id     { 2 }
    job_city          { 'test' }
    job_house_number  { 'test' }
    building_name     { 'test' }
    association     :user
  end
end
