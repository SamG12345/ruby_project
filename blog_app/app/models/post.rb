class Post < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    # relation to comment
    has_many :comments, dependent: :destroy
end
