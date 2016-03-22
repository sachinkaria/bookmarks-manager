
# As a user
# So that I can view my saved links
# I want a homepage that displays all my saved links
feature 'view links on homepage' do
  scenario 'includes one persistant link on homepage' do
    visit '/links'

    Link.create(url: "www.google.com", title: "Google")
    within 'ul#links' do
      expect(page).to have_content "Google"
    end
  end
end
