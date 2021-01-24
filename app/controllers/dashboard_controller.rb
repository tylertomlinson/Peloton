class DashboardController < ApplicationController
  def index
    @user = current_user
    @rides = @user.rides.all
  end
end
