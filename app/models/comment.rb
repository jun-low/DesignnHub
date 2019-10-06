class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :design
  has_many :votes, dependent: :destroy

  validates :content, presence: true
  validates :upvotes, presence: true
  validates :downvotes, presence: true

  def comment_upvotes
    votes.sum(:upvotes)
  end

  def comment_downvotes
    votes.sum(:downvotes)
  end
end
