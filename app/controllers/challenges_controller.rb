class ChallengesController < ApplicationController
  
  def show
    @challenge= Challenge.find(params[:id])
  end

  def create 
    challenge= current_user.challenges.create(challenge_params)
    redirect_to root_path, redirect_options_for(challenge)
  end

  private

  def challenge_params
    params.require(:challenge).permit(:body)
  end

  def redirect_options_for(challenge)
    if challenge.persisted?
      { notice: "Challenged succesfully" }
    else
      { alert:"Could not Challenge" }
    end
  end
end