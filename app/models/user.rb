class User < ApplicationRecord
  require 'digest'
  has_secure_password
  has_many :lists, dependent: :destroy
  validates :name, presence: true, length: { maximum: 100 }
  validates :password_digest, presence: true
  validates :email, presence: true, length: { maximum: 300 }

  # nameと、passwordを用いてユーザーを検証する
  def self.login(param)
    user = User.find_by(email: param["email"])
    return user if user.nil?
    user.authenticate(param["password"])
  end

end
