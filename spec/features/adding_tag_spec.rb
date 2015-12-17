feature 'adding a tag' do
  scenario 'users may tag their bookmark' do
    visit '/links/new'
    fill_in 'title', with: 'link3'
    fill_in 'url', with: 'www.internet3.com'
    fill_in 'tags', with: 'web link'
    click_button 'Create bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include('web link')
  end
end
