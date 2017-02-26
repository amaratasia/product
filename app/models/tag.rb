class Tag < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :products, :join_table=>:products_tags_mapping
end
