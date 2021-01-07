class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :address
  has_many :jobs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :age
    validates :tell_number
    validates :birthday
  end 
end
