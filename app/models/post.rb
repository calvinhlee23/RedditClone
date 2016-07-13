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

  has_many(
    :comments, dependent: :destroy,
    class_name: 'Comment',
    foreign_key: :post_id
  )

  def top_comments
    self.comments.where(parent_comment_id: nil)
  end


end
