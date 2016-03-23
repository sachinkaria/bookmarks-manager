
feature 'creating links' do

  scenario 'user can create a new link' do
    create_makers_link

    expect(page).to have_content("Makers Academy")
  end
end
