class Comment < ApplicationRecord
  # body has to be there
  validates :body, presence: true

  # refernce to post
  belongs_to :post

  # refernce to parent comment or top/main comment
  belongs_to :parent, class_name: "Comment", optional: true

  # reference to child comment
  has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
end
