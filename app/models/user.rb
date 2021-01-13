class User < ApplicationRecord

  validates :username, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, confirmation: { case_sensitive: false}
  validates :email_confirmation, presence: true
  validates :password, length: {minimum:8}

end





