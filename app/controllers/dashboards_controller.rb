class DashboardsController < ApplicationController

  def show
    @challenge = Challenge.new
    @challenges= current_user.challenges
  end
end