class Taxonomy < ActiveRecord::Base
  has_many :items
end
