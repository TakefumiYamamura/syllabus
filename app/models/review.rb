class Review < ActiveRecord::Base
  belongs_to :lesson
  validates :review, presence: {message: "レビュー書いてね！"}
end
