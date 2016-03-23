feature 'Multiple tags' do
  scenario 'Display multiple tags for a website' do
    add_multi_tag_link
    link = Link.first
    expect(link.tag.map(&:name)).to include("digital", "news", "science")
  end
end
