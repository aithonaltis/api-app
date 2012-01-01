class Region < ActiveRecord::Base
  has_many :streets
  belongs_to :district
end
