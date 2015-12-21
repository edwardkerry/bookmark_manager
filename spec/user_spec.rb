describe User do
  let!(:user) do
    User.create(email: 'edwardkerry@hotmail.com',
                password: 'password1234',
                password_confirmation: 'password1234')
  end

  it 'should authenticate with valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'should not authenticate a wrong password' do
    expect(User.authenticate(user.email, 'wrong password')).to be nil
  end
end
