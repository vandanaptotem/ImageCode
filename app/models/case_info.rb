class CaseInfo < ActiveRecord::Base
  has_many :crime_scenes
  has_many :suspect_infos
  has_many :clue_infos
  has_many :victim_infos
end
