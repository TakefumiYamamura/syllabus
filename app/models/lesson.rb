class Lesson < ActiveRecord::Base
  has_many :lessons
  has_many :sikepuris
  has_attached_file :kakomon,
                    :styles =>  { medium: "100*100>", thumb: "100*100>" }

  validates_attachment_content_type :kakomon,
                    :content_type =>["image/jpeg","image/png","image/png","image/gi"]
end
