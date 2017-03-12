class User < ActiveRecord::Base
	has_and_belongs_to_many :groups, :join_table => :groups_users
	has_many :posts
	has_many :comments
end
