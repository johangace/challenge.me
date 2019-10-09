class LikesController < ApplicationController
  def create
    current_user.like(challenge)
    redirect_to root_path
  end

  def destroy 
    current_user.unlike(challenge)
    redirect_to root_path
  end

  private

  def challenge
    @_challenge ||= Challenge.find(params[:id])
  end
end