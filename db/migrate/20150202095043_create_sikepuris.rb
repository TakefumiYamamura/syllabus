class CreateSikepuris < ActiveRecord::Migration
  def change
    create_table :sikepuris do |t|

      t.timestamps
    end
  end
end
