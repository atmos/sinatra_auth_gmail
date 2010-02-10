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

Example config.ru
-----------------
    require 'rubygems'
    require 'bundler'

    Bundler.setup
    Bundler.require

    class MyFirstGmailApp < Sinatra::Base
      use Rack::Session::Cookie
      register Sinatra::Auth::Gmail

      get '/' do
        authorize!
        haml "%h2= 'Hello There, #{gmail_user.full_name}!'"
      end
    end

    run MyFirstGmailApp

Executing
---------
    % bundle install
    % bundle exec rackup

Visiting
--------
    % open http://localhost:9292

