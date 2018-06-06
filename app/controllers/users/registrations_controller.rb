# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def new
    if user_signed_in? 
      if current_user.admin?
        super
      else
        redirect_to new_user_session_path 
      end
    else
      redirect_to new_user_session_path
    end
  end

end
