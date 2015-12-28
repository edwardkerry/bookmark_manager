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

  it 'saves a password recovery token when token generates' do
    expect{user.generate_token}.to change{user.password_token}
  end

  it 'saves a password recovery token time when we generate a token' do
    Timecop.freeze do
      user.generate_token
      expect(user.password_token_time).to eq Time.now
    end
  end

  it 'can find a user with a valid token' do
    user.generate_token
    expect(User.find_by_valid_token(user.password_token)).to eq user
  end

  it 'can\'t find a user with a token over an hour old' do
    user.generate_token
    Timecop.travel(60*60+1) do
      expect(User.find_by_valid_token(user.password_token)).to eq nil
    end
  end


end
