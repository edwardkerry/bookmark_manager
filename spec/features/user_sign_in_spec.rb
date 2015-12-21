feature 'user sign in' do

  let(:user) do
    User.create(email: 'edwardkerry@hotmail.com',
                password: 'password1234',
                password_confirmation: 'password1234')
  end

  scenario 'a user may sign in' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "#{user.email}, welcome to Bookmark Manager!"
  end

end
