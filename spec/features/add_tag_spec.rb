feature 'creating a new link' do
  
  scenario 'the newly created link appears on the links page' do
  
    start_with_tag
    
    within 'ul#links' do
      expect(page).to have_content("socialmedia")
    end

    link = Link.first
    expect(link.tag.map(&:name)).to include("socialmedia")
  
  end
end
