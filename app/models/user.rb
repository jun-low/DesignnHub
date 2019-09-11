class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :designs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes
  has_many :job_posts, dependent: :destroy
  has_many :job_applications
  has_many :job_experiences, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def upvote(comment)
    votes.create(upvotes: 1, comment: comment)
  end

  def upvoted?(comment)
    votes.exists?(upvotes: 1, comment: comment)
  end

  def remove_vote(comment)
    if comment.upvotes.zero? && comment.downvotes.zero?
      return
    else
      votes.find_by(comment: comment).destroy
    end
  end

  def downvote(comment)
    votes.create(downvotes: 1, comment: comment)
  end

  def downvoted?(comment)
    votes.exists?(downvotes: 1, comment: comment)
  end
end
