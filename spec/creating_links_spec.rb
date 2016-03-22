feature 'creating links' do
  scenario 'user can create a new link' do
    visit('/')
    click_button('New Link')
    fill_in :title, with: 'Makers Academy'
    fill_in :url, with: 'http://www.makersacademy.co.uk'
    click_button('Submit Link')
    expect(page).to have_content("Makers Academy")
  end
end
