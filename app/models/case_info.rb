class CaseInfo < ActiveRecord::Base
  has_many :crime_scenes
  has_many :suspect_infos
  has_many :clue_infos
  has_many :victim_infos
  has_attached_file :media
  validates_attachment_content_type :media, :content_type => /\Aimage\/.*\Z/
end
