feature 'tagging bookmarks' do
  scenario 'users may tag their bookmark' do
    create_link_with_tag
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')
  end

  scenario 'users may add multiple tags' do
    visit '/links/new'
    fill_in 'title', with: 'Facebook'
    fill_in 'url', with: 'www.facebook.com'
    fill_in 'tags', with: 'facebook social network'
    click_button('Create bookmark')
    link = Link.first
    expect(link.tags.map(&:name)).to include('facebook', 'social', 'network')
  end
end
