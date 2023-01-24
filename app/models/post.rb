class Post < ApplicationRecord
 has_many :likes, foreign_key: "posts_id"
 has_many :comments, foreign_key: 'posts_id' 
 belongs_to :author, class_name: 'User', foreign_key: 'author_id'

 def update_posts_couter
  author.increment!(:posts_couter)
 end

 def last_five_comments
  comments.last(5)
 end
end
