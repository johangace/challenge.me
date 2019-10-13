class DashboardsController < ApplicationController

  def show
    @challenge = Challenge.new
    @challenges= current_user.timeline_challenges
  end
end
