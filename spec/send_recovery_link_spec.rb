require 'send_recovery_link'

describe SendRecoveryLink do
  let(:user) { double :user,
              email: 'test@test.com',
              password: 'password1234',
              password_token: '123456'}
  let(:mailgun_client) { double :mailgun_client }
  let(:sandbox_domain_name) { ENV['MG_DOMAIN_NAME']}


  it 'should send a recovery email link' do
    params =  {:from => "postmaster@sandbox0ff72e05ab1f484d8e6aac6888e2de40.mailgun.org",
              :to => user.email,
              :subject => "reset your password",
              :text => "Click here to reset your password: http://vast-bastion-7432.herokuapp.com/reset_password?token=#{user.password_token}" }
    expect(mailgun_client).to receive(:send_message).with(sandbox_domain_name, params)
    described_class.call(user, mailgun_client)
  end


end
