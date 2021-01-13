class Job < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  with_options presence:true, numericality: { other_than: 0 } do
    validates :prefecture_id
    validates :category_id
  end

  with_options presence:true do
    validates :order_title
    validates :order_detail
    validates :period
    validates :order_price
    validates :job_post_code
    validates :job_city
  end
  
  belongs_to :user  
  
end
