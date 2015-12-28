feature 'password recover' do

  before do
    sign_up
    Capybara.reset!
    allow(SendRecoveryLink).to receive(:call)  
  end
  let(:user) { User.first }

  scenario 'user may ask for password recovery' do
    visit 'sessions/new'
    click_button 'Forgotten password?'
    expect(page).to have_content "Please enter your email address"
  end

  scenario 'users are asked to check email for password' do
    recover_password
    expect(page).to have_content 'Please check your email'
  end

  scenario 'users are assigned a reset token on recovery' do
    expect{recover_password}.to change{User.first.password_token}
  end

  scenario 'tokens expire after an hour' do
    recover_password
    Timecop.travel(60*60*60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content "Your token is invalid"
    end
  end

  scenario 'it asks for a new password if token is still valid' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content "Please enter your new password"
  end

  scenario 'it lets you enter a new password' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: 'newpassword'
    fill_in :password_confirmation, with: 'newpassword'
    click_button "Submit"
    expect(page).to have_content("Sign in to Bookmark Manager")
  end

  scenario 'password reset should allow a sign-in' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: 'newpassword'
    fill_in :password_confirmation, with: 'newpassword'
    click_button "Submit"
    sign_in(email: 'edward.kerry@hotmail.com', password: 'newpassword')
    expect(page).to have_content "edward.kerry@hotmail.com, welcome to Bookmark Manager"
  end

  scenario 'it lets you know if your passwords dont match' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: 'newpassword'
    fill_in :password_confirmation, with: 'badpassword'
    click_button "Submit"
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'it calls the SendRecoveryLink service to send the link' do
    expect(SendRecoveryLink).to receive(:call).with(user)
    recover_password
  end

  def recover_password
    visit '/users/recover'
    fill_in :email, with: 'edward.kerry@hotmail.com'
    click_button 'Submit'
  end

end
