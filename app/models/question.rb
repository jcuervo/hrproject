class Question < ActiveRecord::Base
  has_many :qandas
  has_many :applicants, :through => :qandas
end
