class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :image
  
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 
  
  has_many :user_id, dependent: :destroy
end
