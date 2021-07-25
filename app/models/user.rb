class User < ApplicationRecord
  require 'digest'
  has_secure_password

  # nameと、passwordを用いてユーザーを検証する
  def self.login(param)
    user = User.find_by(email: param["email"])
    return user if user.nil?
    user.authenticate(param["password"])
  end

  # userに対して、セッションキーを発行と保存を行う
  def set_session_key
    sha256 = Digest::SHA256.new
    sha256.update("#{Time.current}_SOLT")
    self.session_key = sha256.hexdigest

    if self.save
      self.session_key
    else
      nil
    end
  end
end
