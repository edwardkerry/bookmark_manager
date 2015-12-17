feature 'creating bookmarks' do
  scenario 'users may bookmark a website title and url' do
    create_link
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content("Title: Facebook URL: www.facebook.com")
    end
  end
end
