feature 'user sign up' do
  scenario 'should increase user count by 1' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content 'edward.kerry@hotmail.com, welcome to Bookmark Manager!'
    expect(User.first.email).to eq('edward.kerry@hotmail.com')
  end

  scenario 'should confirm validation of password' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'should require an email' do
    expect{sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario 'should require correct email format' do
    sign_up(email: 'edward,kerry@com')
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'should require email' do
    sign_up(email: '')
    expect(page).to have_content 'Email must not be blank'
    end

  scenario 'should not allow already registered email address' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end


end
