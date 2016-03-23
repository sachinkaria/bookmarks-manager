
feature 'adding tags' do

  scenario 'when we are creating new links' do
    visit('/')
    click_button('New Link')
    fill_in :title, with: 'Makers Academy'
    fill_in :url, with: 'http://www.makersacademy.co.uk'
    fill_in :tags, with: 'coding'
    click_button('Submit Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('coding')
  end
end