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
        def warden
          env['warden']
        end

        def authorized?
          puts "authorized? depricated.  Use authenticate! instead"
          authenticate!
        end

        def authenticate!(*args)
          warden.authenticate!(*args)
        end

        def authenticated?(*args)
          warden.authenticated?(*args)
        end

        def authorize!
          puts "authorize! is depricated. Use authenticate! instead"
          warden.authenticate!
        end

        def logout!
          warden.logout
        end

        def gmail_user
          puts "gmail_user is depricated.  Use google_user instead"
          google_user
        end

        def google_user
          warden.user
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
          authenticate!
        end

        get '/' do
          haml "%h2= 'Hello There, #{google_user.full_name}!'"
        end

        get '/another_route' do
          haml "%h2= 'Hello There, #{google_user.full_name}!'"
        end
      end
    end
  end
end
