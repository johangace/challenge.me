class ChallengeSearchQuery 
  def initialize(term:)
    @term = term
  end
  
  def to_relation
    Challenge.
      joins("LEFT JOIN text_challenges ON content_type= 'TextChallenge' AND content_id = text_challenges.id").
      where("text_challenges.body LIKE ?", "%#{term}%")
  end
  private 
  attr_reader :term
end
