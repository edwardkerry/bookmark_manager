feature 'viewing a list' do
  scenario 'users may view their bookmarks' do
    Link.create url: 'www.link1.com', title: 'link1'
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content 'link1'
    end
  end
end
