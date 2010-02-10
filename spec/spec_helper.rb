Bundler.setup(:runtime, :test)
Bundler.require(:runtime, :test)
require File.join(File.dirname(__FILE__), '..', 'lib', 'sinatra_auth_gmail')
require 'pp'

Spec::Runner.configure do |config|
  config.include(Rack::Test::Methods)

  def app
    Sinatra::Auth::Gmail::ExampleApp
  end
end
