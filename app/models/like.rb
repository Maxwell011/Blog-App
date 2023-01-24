class Like < ApplicationRecord
 belongs_to :post
 belongs_to :author, class_name: 'User', foreign_key: 'author_id'

 def update_likes_counter
  self.update(likes_counter: self.likes.count)
 end
end
