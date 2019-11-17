class Timeline

  def initialize(users, scope = Challenge)
    @users = users 
    @scope = scope
  end

  def to_partial_path
     "timelines/timeline"
  end


  def challenges 
    scope.
      where(user_id: users).
      order(created_at: :desc) 
  end

  private
  attr_reader :users, :scope

end
