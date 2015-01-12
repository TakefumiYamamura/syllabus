class RenameProductidToReview < ActiveRecord::Migration
  def change
    rename_column :reviews, :product_id, :lesson_id
  end
end
