require 'data_mapper'
require 'dm-validations'
require 'bcrypt'

class User

  include DataMapper::Resource
  property :id,     Serial
  property :email,  String, unique: true, required: true, format: :email_address
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
