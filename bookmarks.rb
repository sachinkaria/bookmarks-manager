require_relative 'models/link'
require 'sinatra/base'

class Bookmarks < Sinatra::Base

# get '/' do
#   redirect '/links/index'
# end

get '/links' do
  @links = Link.all
  erb :'links/index'
end

run! if app_file ==$0
end