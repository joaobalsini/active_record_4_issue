class Designer < ActiveRecord::Base
  has_many :items
  has_and_belongs_to_many :all_taxonomies, class_name: 'Taxonomy', join_table: 'designers_taxonomies', association_foreign_key: 'taxonomy_id'
  has_and_belongs_to_many :accepted_taxonomies, class_name: 'Taxonomy', join_table: 'accepted_designers_taxonomies', association_foreign_key: 'taxonomy_id'
  has_and_belongs_to_many :exception_taxonomies, class_name: 'Taxonomy', join_table: 'exception_designers_taxonomies', association_foreign_key: 'taxonomy_id'
end
