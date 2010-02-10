module Sinatra
  module Auth
    module Gmail
      class BadAuthentication < Sinatra::Default
        get '/unauthenticated' do
          status 403
          haml "%h3= 'Unable to authenticate, sorry bud.'"
        end
      end

      module Helpers
        def authorized?
          env['warden'].authenticate!
        end

        def authorize!
          throw(:warden) unless authorized?
        end

        def logout!
          env['warden'].logout
        end

        def gmail_user
          env['warden'].user
        end
      end

      def self.registered(app)
        app.use Warden::Manager do |manager|
          manager.default_strategies :google_apps
          manager.failure_app = BadAuthentication

          manager[:google_apps_endpoint] = 'http://www.google.com/accounts/o8/id'
        end
        app.helpers Helpers

        app.get '/logout' do
          logout!
          haml "%h2= 'Peace!'"
        end
      end

      class ExampleApp < Sinatra::Base
        register Sinatra::Auth::Gmail

        before do
          authorize!
        end

        get '/' do
          haml "%h2= 'Hello There, #{gmail_user.full_name}!'"
        end

        get '/another_route' do
          haml "%h2= 'Hello There, #{gmail_user.full_name}!'"
        end
      end
    end
  end
end
