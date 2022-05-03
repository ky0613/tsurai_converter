class YoutubeApiClient
  YOUTUBE_HOST = "https://www.googleapis.com/youtube/v3/search?"

  def initialize
    @token = Rails.application.credentials.youtube[:token]
  end

  def get_lists(query)
    params = URI.encode_www_form({
      key: @token,
      part: "snippet",
      q: query
    })
    uri = URI.parse("#{YOUTUBE_HOST}#{params}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    JSON.parse(response.body)
  end

  class << self
    def client
      YoutubeApiClient.new
    end

    def get_lists(query)
      client.get_lists(query)
    end
  end
end
