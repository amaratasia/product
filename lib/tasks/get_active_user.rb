task :get_active_user =>  :environment do |t,args|
#In Case of Individual Mails based on Active Scoring
	bulk_data = []
	Group.includes(:users=>[{:posts=>:comments}]).find_each do |group|
		active_data = []
		group.users.each do |user|
			post_detail = user.posts.limit_by_days(10)
			comment_detail = user.comments.limit_by_days(10)
			score = ((post_detail.size * 5) + (comment_detail.size * 3))
			active_data  << {:user_id => user.id, :score => score, :email=>user.email, :group_id => group.id}
		end
		complete_data = active_data.sort_by  {|data| data[:score]}.reverse.take(10)
		bulk_data << complete_data if complete_data.present?
		#In Case of Individual Mails based on Active Scoring
		 UserMailer.send_message("user@f22labs.com",complete_data.collect{|user| user[:email]}, "Weekly Report",complete_data)
	end
	#For One Mail per user
	bulk_data = bulk_data.group_by {|data| data[:email]}
	bulk_data.each do |email, group_list|
		 UserMailer.send_single_user_message("user@f22labs.com",email, "Weekly Report", group_list)
	end
end
task :default => ["get_active_user"]