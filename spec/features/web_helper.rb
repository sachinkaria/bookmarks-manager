def start_with_tag
  User.create(name: "Sachin", password: "password", email: "sachin.karia01@gmail.com")
    visit '/links/new'
    fill_in(:title, with: "Facebook")
    fill_in(:url, with: "www.facebook.com")
    fill_in(:tag, with: "socialmedia")
    click_button("Submit")
end

def add_socialmedia_link
  User.create(name: "Sachin", password: "password", email: "sachin.karia01@gmail.com")
  visit '/links/new'
  fill_in(:title, with: "Twitter")
  fill_in(:url, with: "www.Twitter.com")
  fill_in(:tag, with: "socialmedia")
  click_button("Submit")
end

def add_news_link
  User.create(name: "Sachin", password: "password", email: "sachin.karia01@gmail.com")
  visit '/links/new'
  fill_in(:title, with: "BBC")
  fill_in(:url, with: "www.BBC.com")
  fill_in(:tag, with: "news")
  click_button("Submit")
end

def add_multi_tag_link
  User.create(name: "Sachin", password: "password", email: "sachin.karia01@gmail.com")
  visit '/links/new'
  fill_in(:title, with: "Techcrunch")
  fill_in(:url, with: "www.techcrunch.com")
  fill_in(:tag, with: "news digital science")
  click_button("Submit")
end

def new_user
  visit '/users/new'
  fill_in(:name, with: "Sachin")
  fill_in(:password, with: "Password")
  fill_in(:email, with: "sachin.karia01@gmail.com")
  click_button("Sign Up")
end