class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [10, 10]
  end
  has_many :posts
  has_many :comments

end
