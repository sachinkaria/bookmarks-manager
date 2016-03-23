require 'pry'

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
    
    
    params[:tag].split.each do |tag_name|
    link.tag << Tag.create(name: tag_name)
    end

    
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb(:'links/new')
  end

  get '/links/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.link : []
    erb(:'links/index')
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
