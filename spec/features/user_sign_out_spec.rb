feature 'user sign out' do
  before(:each) do
      User.create(email: 'edwardkerry@hotmail.com',
                  password: 'password1234',
                  password_confirmation: 'password1234')
  end

  scenario 'when signed in' do
    sign_in(email: 'edwardkerry@hotmail.com', password: 'password1234')
    click_button('Sign out')
    expect(page).not_to have_content 'edwardkerry@hotmail.com, welcome to'
  end
end
