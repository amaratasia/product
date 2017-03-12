class Comment < ActiveRecord::Base
	belongs_to :post
	validates :data, presence: true

	scope :limit_by_days, lambda {|no_of_day|
	    where("updated_at > ? ", Date.today - no_of_day.days)
	  }
end
