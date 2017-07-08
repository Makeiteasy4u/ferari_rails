class Post < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 2, maximum: 36}
  validates :description, presence: true, length: {minimum: 2, maximum: 362}
end