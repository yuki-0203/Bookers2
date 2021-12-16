class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image
  
  validates :name, presence: true,length: { in: 2..20 },uniqueness: true
  validates :introduction,{length : {minimum:50} },on: :update
  
  has_many :books, dependent: :destroy
end
