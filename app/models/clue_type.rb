class ClueType < ActiveRecord::Base
  # belongs_to :clue_info, :class_name => 'ClueType'
  # has_many :children, :class_name => 'ClueType', :foreign_key => 'parent_id'
  belongs_to :clue_info
  belongs_to :child, :class_name => "ClueInfo"
end
