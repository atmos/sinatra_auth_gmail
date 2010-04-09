require 'rubygems'
require 'sinatra_auth_gmail'

class MyFirstGmailApp < Sinatra::Base
  use Rack::Session::Cookie
  register Sinatra::Auth::Gmail

  get '/' do
    authorize!
    haml "%h2= 'Hello There, #{gmail_user.full_name}!'"
  end
end

run MyFirstGmailApp
