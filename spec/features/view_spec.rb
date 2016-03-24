
# As a user
# So that I can view my saved links
# I want a homepage that displays all my saved links
feature 'view links on homepage' do
  scenario 'includes one persistant link on homepage' do
  User.create(name: "Sachin", password_digest: "password", email: "sachin.karia01@gmail.com")
    Link.create(url: "www.google.com", title: "Google")
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content "Google"
    end
  end
end
