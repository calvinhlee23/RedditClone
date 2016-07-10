class Sub < ActiveRecord::Base
  validates :title, :description, :user_id, presence: true
  validates :title, uniqueness: true

  belongs_to(
  :moderator,
  class_name: 'User',
  foreign_key: :user_id
  )

  has_many(
  :posts,
  class_name: 'Post',
  foreign_key: :sub_id
  )
end
