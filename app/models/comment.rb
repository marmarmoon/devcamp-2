class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  
  validates :content, presence: true, length: {minimum: 10, maximimum: 1000 }
  
  after_create_commit { CommentBroadcastJob.peform_later(self) }
end