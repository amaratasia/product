class Group < ActiveRecord::Base
	has_and_belongs_to_many :users, :join_table => :groups_users
	has_many :posts
	validates :name, presence: true
	# validates :name, length: { minimum: 5 }
end