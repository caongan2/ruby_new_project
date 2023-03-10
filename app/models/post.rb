class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  delegate :username, to: :user, prefix: true, allow_nil: true
end
