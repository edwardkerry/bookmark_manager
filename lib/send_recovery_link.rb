require 'mailgun'

class SendRecoveryLink

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV["MG_API_KEY"])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(
    ENV['MG_DOMAIN_NAME'],
    from: "postmaster@" << ENV['MG_DOMAIN_NAME'],
    to: user.email,
    subject: "reset your password",
    text: "Click here to reset your password: http://vast-bastion-7432.herokuapp.com/reset_password?token=#{user.password_token}" )
  end

  private

  attr_reader :mailer

end
