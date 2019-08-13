class Comment < ApplicationRecord

validates :content, :author_id, :post_id, presence: true

belongs_to :post
end
