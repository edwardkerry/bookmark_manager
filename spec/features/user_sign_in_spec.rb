feature 'user sign up' do
  scenario 'should increase user count by 1' do
    sign_up
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content 'edward.kerry@hotmail.com, welcome to Bookmark Manager!'
    expect(User.first.email).to eq('edward.kerry@hotmail.com')
  end
end
