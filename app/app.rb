require 'pry'

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class Bookmark < Sinatra::Base
  enable :sessions
set :session_secret, 'super secret'

  get '/' do
    'Hello Bookmark!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = User.id
    redirect to('/links')
  end


  get '/links' do
    @user = User.first
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tag].split.each do |tag_name|
    link.tag << Tag.first_or_create(name: tag_name)
    end
    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  get '/links/:name' do
    tag = Tag.all(name: params[:name])
    @user = User.first
    @links = tag ? tag.link : []
    erb(:'links/index')
  end


helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
