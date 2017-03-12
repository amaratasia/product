class Post < ActiveRecord::Base
	belongs_to :group
	has_many :comments
	validates :data, :user_id, :group_id, presence: true
	# validates :data, length: { minimum: 2 }
	scope :limit_by_days, lambda {|no_of_day|
	    where("posts.updated_at > ? ", Date.today - no_of_day.days)
	}
end
