class CrimeScene < ActiveRecord::Base
  has_many :clue_infos
  belongs_to :case_info
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
