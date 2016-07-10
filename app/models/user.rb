class User < ActiveRecord::Base
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: {messages: "password cannot be blank"}
  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= User.generate_sessions_token
  end

  def self.find_by_credential(email, password)
    user = User.finy_by_email(params[:email])
    user && user.is_password?(password) ? user : nil
  end

  def self.generate_sessions_token
    @session = SecureRandom.urlsafe_base64
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    new_token = User.generate_sessions_token
    self.session_token = new_token
  end

  def is_password?(password)
    return true if BCrypt::Password.new(self.password_digest).is_password?(password)
    false
  end


end
