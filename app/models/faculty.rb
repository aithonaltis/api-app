class Faculty < ActiveRecord::Base
  belongs_to :university
  has_many :departments
end
