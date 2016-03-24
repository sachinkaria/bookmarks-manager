require 'pry'

feature 'add user' do

  scenario 'and user count increases by 1' do
    user = User.create(name: "Sachin", password: "password", email: "sachin.karia01@gmail.com")
    binding.pry
    expect(user.name.count).to eq 1
  end

  scenario 'and page displays welcome message to user' do
    new_user
    expect(page).to have_content("Welcome Sachin")
  end

  scenario 'and the email for that user is correctly stored in our DB' do
    new_user
    user = User.first
    expect(user.first.map(&:email)).to include("sachin.karia01@gmail.com")
  end

end