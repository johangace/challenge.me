class UsersController < Clearance::UsersController 
  def new
    @user = User.new
    render template: "users/new"
  end

  def show
    @user= User.find(params[:id])
    @challenges = @user.challenges
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end 