class University < ActiveRecord::Base
  has_many :faculties
  has_many :departments
end
