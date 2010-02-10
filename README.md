sinatra_auth_gmail
==================

A sinatra app that lets you authenticate users via gmail.

Developing
==========
    % gem install bundler
    % bundle install
    % bundle exec rake

Gemfile
-------
    gem "sinatra_auth_gmail"
    # vim:ft=ruby

Example
-------
    module Fooby
      class App < Sinatra::Base
        register Sinatra::Auth::Gmail
        get '/' do
          authorize!
          haml "%h2= 'Hello There, #{gmail_user.full_name}!'"
        end
      end
    end
