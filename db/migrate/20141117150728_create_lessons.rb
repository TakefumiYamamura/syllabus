class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :context
      t.string :teacher
      t.string :room
      t.string :credit
      t.string :period

      t.timestamps
    end
  end
end
