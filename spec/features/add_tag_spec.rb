feature 'creating a new link' do
  scenario 'there is a form to input new link data' do
    visit '/links/new'
    expect(page).to have_field("title")
    expect(page).to have_field("url")
  end

  scenario 'the newly created link appears on the links page' do
    visit '/links/new'
    fill_in(:title, with: "Facebook")
    fill_in(:url, with: "www.facebook.com")
    fill_in(:tag, with: "Social Media")
    click_button("Submit")
    visit '/links/tag'
    expect(page).to have_content("Social Media")
  end
end
