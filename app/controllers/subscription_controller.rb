class SubscriptionController < ApplicationController
  def update
		current_user.role = 'standard'
		current_user.wikis.each do |wiki|
			wiki.update_attribute(:private, false)
		end
		current_user.save

		redirect_to edit_user_registration_path
  end
end
