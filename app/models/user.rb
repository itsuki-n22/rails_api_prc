class User < ApplicationRecord
  require 'digest'
  has_secure_password

  # nameと、passwordを用いてユーザーを検証する
  def self.login(param)
    user = User.find_by(email: param["email"])
    return user if user.nil?
    user.authenticate(param["password"])
  end

end
