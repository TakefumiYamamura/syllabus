class AddAttachmentKakomonToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :kakomon
    end
  end

  def self.down
    remove_attachment :lessons, :kakomon
  end
end
