class District < ActiveRecord::Base
  has_many :regions
  belongs_to :city
end
