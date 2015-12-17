def create_link
  visit 'links/new'
  fill_in 'title', with: 'Facebook'
  fill_in 'url', with: 'www.facebook.com'
  click_button 'Create bookmark'
end

def create_link_with_tag
  visit '/links/new'
  fill_in 'title', with: 'Facebook'
  fill_in 'url', with: 'www.facebook.com'
  fill_in 'tags', with: 'social'
  click_button 'Create bookmark'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'edward.kerry@hotmail.com'
  fill_in :password, with: 'password1234'
  click_button('Sign up!')
end
