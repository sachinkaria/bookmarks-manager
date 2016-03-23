ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class Bookmark < Sinatra::Base

  get '/' do
    'Hello Bookmark!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tag])
    LinkTag.create(:link => link, :tag => tag)
    redirect '/links'
  end

  get '/links/tag' do
    @tag=Tag.all
    erb (:'links/tag')
  end

  get '/links/new' do
    erb(:'links/new')
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
