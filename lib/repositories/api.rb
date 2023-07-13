
module Repositories
  class Api
    GITHUB_API = 'https://api.github.com'
    LANGUAGE = 'ruby'

    def initialize(options)
      @options = options
    end

    def repositories
      response = Faraday.get("#{GITHUB_API}/search/repositories?q=language:" + "#{LANGUAGE}" + "&sort=stars&order=desc&per_page=5", nil, headers)

      body = JSON.parse(response.body, symbolize_name: true)
      resp = {
        status: response.status,
        body: body
      }

      return resp
    end

    private

    def headers
      {
        'Content-Type' => 'application/json'
      }
    end
  end
end