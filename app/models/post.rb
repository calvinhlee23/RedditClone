class Post < ActiveRecord::Base
  validates :title, :author_id, :subs, presence: true

  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )


  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id
  )

  has_many(
    :post_subs, dependent: :destroy, inverse_of: :post,
    class_name: 'PostSub',
    foreign_key: :post_id
  )
end
