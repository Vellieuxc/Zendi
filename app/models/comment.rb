class Comment < ApplicationRecord
  has_attachment :photo
  belongs_to :user
  belongs_to :doctor
  has_many :upvotes
end
