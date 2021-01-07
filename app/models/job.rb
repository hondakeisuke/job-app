class Job < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  with_options presence:true, numericality: { other_than: 0 } do
    validates :prefecture_id
    validates :category_id
  end

  belongs_to :user
  has_many :rooms
  
end
