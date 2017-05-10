class Project < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", large: "800x800>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :project_name, 	:presence => true
  validates :description, 	:presence => true
  validates :link, 			:presence => true
  acts_as_taggable

end
