class Post < ApplicationRecord

  validates :title, presence: true
  belongs_to(:user)
  belongs_to(:sub)

  has_many(:comments,
  primary_key: :id,
  foreign_key: :post_id,
  class_name: "Comment"
  )
end
