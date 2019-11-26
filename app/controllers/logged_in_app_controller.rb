class LoggedInAppController < ApplicationController
  before_action :authenticate_user!
end
