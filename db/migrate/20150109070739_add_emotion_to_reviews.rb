class AddEmotionToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :emotion, :string
  end
end
