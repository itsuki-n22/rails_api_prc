class Api::V1::UsersController < Api::V1::Base
  def index
    user = User.take
    render json: {state:"success",msg:"User profile",profile: {name:user.name } } , status: 200
    
  end

  def create
    user = User.new(user_params)
    render json: {state:"success",msg:"User profile",profile: {name:user.name } } , status: 200
    
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :name)
    end
end