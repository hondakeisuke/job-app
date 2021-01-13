class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  with_options presence: true do
    validates :post_code,format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :house_number
    validates :prefecture_id, numericality: { other_than: 0 } 
  end
  
  validates :prefecture_id, numericality: { other_than: 0 } 

end
