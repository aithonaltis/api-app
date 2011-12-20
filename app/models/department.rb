class Department < ActiveRecord::Base
  belongs_to :faculty
  belongs_to :university
end
