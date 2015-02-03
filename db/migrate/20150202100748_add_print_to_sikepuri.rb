class AddPrintToSikepuri < ActiveRecord::Migration
  def change
    add_column :sikepuris, :print, :string
  end
end
