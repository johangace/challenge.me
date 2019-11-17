class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @results = Challenge.
    joins("LEFT JOIN text_challenges ON content_type= 'TextChallenge' AND content_id = text_challenges.id").
    where("text_challenges.body LIKE ?", "%##{@hashtag}%")
  end
end
