class UserMailer < ApplicationMailer
	def send_message(from_email, to_emails, subject= "", content)
		@content = content
		to_emails.each do |to_email|
			mail(from: from_email,to: to_email, subject: subject)#.deliver_later
		end
	end
end