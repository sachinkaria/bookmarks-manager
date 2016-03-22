feature 'view links' do
  scenario 'user can see list of links' do
      Link.create(
      :title => 'Google',
      :url => 'http://google.com'
      )
      visit '/'
      expect(page.status_code).to eq 200

      within '#links' do
        expect(page).to have_content('Google')
      end
  end
end