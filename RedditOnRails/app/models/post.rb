class Post < ApplicationRecord
  

  validates :title, :sub_id, :author_id, presence: true
  
  belongs_to :user,
  foreign_key: :author_id,
  class_name: :User 

  belongs_to :sub,
  foreign_key: :sub_id,
  class_name: :Sub 

  has_many :comments

end
