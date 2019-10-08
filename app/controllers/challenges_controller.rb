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
    {content: content_from_params }
  
  end

  def content_from_params
    case params[:challenge][:content_type]
      when "TextChallenge" then TextChallenge.new(text_challenge_content_params)
      when "PhotoChallenge" then PhotoChallenge.new(photo_challenge_content_params)
    end
  end

  def text_challenge_content_params
    params.require(:challenge).require(:content).permit(:body)
  end

  def photo_challenge_content_params
    params.require(:challenge).require(:content).permit(:image)
  end

  def redirect_options_for(challenge)
    if challenge.persisted?
      { notice: "Challenged succesfully" }
    else
      { alert:"Could not Challenge" }
    end
  end
end