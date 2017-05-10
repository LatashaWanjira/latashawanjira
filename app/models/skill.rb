class Skill < ApplicationRecord
  validates :skill_name, 		:presence => true
  validates :proficiency_level, :presence => true
end
