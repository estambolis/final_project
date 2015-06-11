class RegistrationsController < Devise::RegistrationsController


def destroy

  current_user.experiences.each do |experience|
    experience.destroy
  end

  current_user.friend_requests_where_sender.each do |follow|
    follow.destroy
  end

  resource.destroy
  set_flash_message :notice, :destroyed
  sign_out_and_redirect(self.resource)
end



end
