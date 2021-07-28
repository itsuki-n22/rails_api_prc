class Api::V1::AuthController < Api::V1::Base
  def login
    if user = User.login(params) 
      session[:user_id] = user.id
      render json: { userId: user.id } , status: 200
    else
      render json: {state:"failure",message:"Error"} , status: 400
    end
  end

  def logout
    if current_user.id == auth_params[:id]
      session.delete(:user_id)
      render json: { userId: nil } , status: 200
    else
      render json: {state:"failure",message:"Error"} , status: 400
    end
  end

  def get_csrf_token; end

  private
  
    def auth_params
      params.require(:auth).permit(:id, :email, :password)
    end
  
end
