# user model
class User < ApplicationRecord
  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable

  has_one :resume
end
