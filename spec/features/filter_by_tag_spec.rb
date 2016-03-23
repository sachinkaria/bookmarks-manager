feature 'Filter' do
  scenario 'list websites by tag' do
    start_with_tag
    add_socialmedia_link
    add_news_link
    visit 'links/socialmedia'
      expect(page).to have_content("Twitter")
      expect(page).to have_content("Facebook")
      expect(page).not_to have_content("News")
  end
end
