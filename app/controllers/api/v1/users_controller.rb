class Api::V1::UsersController < Api::V1::Base

  def index
    user = User.take
    render json: {state:"success",msg:"User profile",profile: {name:user.name } } , status: 200
    
  end

  def create
    user = User.new(user_params)
    render json: {state:"success",msg:"User profile",profile: {name:user.name } } , status: 200
    
  end

  def profile
    # Cookieがなければ、無条件にエラー
    return render json: {state:"failure",msg:"Error"} , status: 403 if cookies[:authed].nil?

    # Cookieの内容から、userを検索
    user = User.find_by(session_key: cookies[:authed])

    # usermが取得できていれば、nameを返す
    if user
      render json: {state:"success",msg:"User profile",profile: {name:user.name } } , status: 200
    else
      render json: {state:"failure",msg:"Error"} , status: 403
    end
  end

  def log_out

    return render json: {state:"failure",msg:"Error"} , status: 403 if cookies[:authed].nil?

    user = User.find_by(session_key: cookies[:authed])

    # cookieを削除
    cookies.delete :authed

    if user.remove_session_key
      render json: {state:"success",msg:"Log Outed" } , status: 200
    else
      render json: {state:"failure",msg:"Error"} , status: 403
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :name)
    end
end