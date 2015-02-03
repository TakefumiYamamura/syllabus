class AddUserIdToSikepuris < ActiveRecord::Migration
  def change
    add_column :sikepuris, :user_id, :integer
  end
end
