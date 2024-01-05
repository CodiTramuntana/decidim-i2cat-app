# frozen_string_literal: true

module Middlewares
  class RedirectMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      if request.path == "/pages"
        [301, { "Location" => request.url.sub("/pages", "/pages/que-es") }, []]
      else
        @app.call(env)
      end
    end
  end
end
