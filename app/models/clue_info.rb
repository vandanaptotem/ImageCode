class ClueInfo < ActiveRecord::Base
  belongs_to :crime_scene
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :case_info
  has_many :clue_types
  has_many :children , :through => :clue_types
end
