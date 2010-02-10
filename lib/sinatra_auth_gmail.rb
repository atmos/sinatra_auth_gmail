require 'sinatra/base'
require 'haml/util'
require 'haml/engine'
require 'warden-googleapps'

module Sinatra
  module Auth
    module Gmail
    end
  end
end

require File.join(File.dirname(__FILE__), 'sinatra', 'auth', 'gmail')
