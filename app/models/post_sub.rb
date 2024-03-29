class PostSub < ActiveRecord::Base
  validates :sub_id, :post, presence: true

  belongs_to(
    :sub,
    class_name: 'Sub',
    foreign_key: :sub_id
  )

  belongs_to(
    :post,
    class_name: 'Post',
    foreign_key: :post_id
  )
end
