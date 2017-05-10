class Comment < ApplicationRecord
  belongs_to :blogpost

  validates :comment, :presence => true
end
