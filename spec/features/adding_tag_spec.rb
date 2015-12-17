feature 'adding a tag' do
  scenario 'users may tag their bookmark' do
    create_link_with_tag
    link = Link.first
    expect(link.tags.map(&:name)).to include('web link')
  end
end
