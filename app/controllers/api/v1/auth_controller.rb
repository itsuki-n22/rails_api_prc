class Api::V1::AuthController < Api::V1::Base
  def login
    session[:a] = "ho"
    if u = User.login(params)
      # 認証成功したので、
      # cookieにセッション情報を書き込み
      cookies.signed[:authed] = { value: u.set_session_key, expires: 1.hour.from_now }
      render json: {userId: 1, token: "hoge"} , status: 200
    else
      # 認証に失敗したので、エラーを返す。
      # 今回は簡単にエラーであることを通知
      cookies[:hoge] =  { hoge: "h"}
      render json: {state:"failure",message:"Error"} , status: 400
    end
  end

  def logout
    p session.to_hash

  end

  def get_csrf_token; end
end
