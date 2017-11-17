class SubscriptionController < ApplicationController
  def update
		current_user.role = 'standard'
		current_user.save

		redirect_to edit_user_registration_path
  end
end
