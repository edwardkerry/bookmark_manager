feature 'viewing a list' do

  before(:each) do
    Link.create(url: 'www.bubblebobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'www.digdug.com', title: 'Dig Dug', tags: [Tag.first_or_create(name: 'diggers')])
    Link.create(url: 'www.rainbowislands.com', title: 'Rainbow Islands', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'www.newzealandstory.com', title: 'New Zealand Story', tags: [Tag.first_or_create(name: 'kiwis')])
  end

  scenario 'users may view their bookmarks' do
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content 'Bubble Bobble'
    end
  end

  scenario 'users may filter their links by tag' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content('Bubble Bobble')
      expect(page).not_to have_content('Dig Dug')
    end
  end

end
