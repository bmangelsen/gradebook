class User < ApplicationRecord
  attr_reader :password
  validates :name, presence: true
  validates :type, presence: true
  validates :password, presence: true

  def authorize!(unhashed_password)
    @_bcrypt_password ||= BCrypt::Password.new(password_hash)
    @_bcrypt_password == unhashed_password
  end

  def password=(unhashed_password)
    @password = unhashed_password
    @_bcrypt_password = BCrypt::Password.create(@password)
    self.password_hash = @_bcrypt_password
  end
end
