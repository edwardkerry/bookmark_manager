def create_link
  visit 'links/new'
  fill_in 'title', with: 'link1'
  fill_in 'url', with: 'www.internet.com'
  click_button 'Create bookmark'
end

def create_link_with_tag
  visit '/links/new'
  fill_in 'title', with: 'link3'
  fill_in 'url', with: 'www.internet3.com'
  fill_in 'tags', with: 'web link'
  click_button 'Create bookmark'
end
