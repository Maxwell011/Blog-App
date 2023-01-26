class Post < ApplicationRecord
  has_many :likes, foreign_key: 'posts_id'
  has_many :comments, foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User', dependent: :destroy, foreign_key: 'author_id'
  after_save :update_post_counter

  validates :title, presence: true, length: { in: 1..250 }
  validates :author_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def last_five_comments
    comments.last(5)
  end
end
