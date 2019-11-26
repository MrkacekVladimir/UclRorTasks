class HomeController < ApplicationController
  def index
    if :authenticate_user!
      redirect_to dashboard_path
    else
      redirect_to new_user_session_path
    end
  end
end
