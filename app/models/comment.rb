class Comment < ApplicationRecord

    validates :content, :user, presence: true

    belongs_to(:user)
    belongs_to(:post)
end
