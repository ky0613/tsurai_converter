class SpotifyGetMetaData

  ACCSESS_TOKEN_HOST = "https://accounts.spotify.com/api/token?grant_type=client_credentials"
  SPOTIFY_HOST = "https://api.spotify.com/v1/search?"
  SPOTIFY_ANALYSIS = "https://api.spotify.com/v1/audio-analysis/"

  def initialize
    client_id = Rails.application.credentials.spotify[:id]
    client_secret = Rails.application.credentials.spotify[:secret]
    uri = URI.parse("#{ACCSESS_TOKEN_HOST}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)
    request["Authorization"] = "Basic #{Base64.encode64("#{client_id}:#{client_secret}").gsub(/\n/, '')}"
    response = http.request(request)
    auth_params = JSON.parse(response.body)
    @token = auth_params["access_token"]
  end

  def get_meta_data(type, query)
    params = URI.encode_www_form({
      type: type,
      q: query,
      limit: 50
    })
    uri = URI.parse("#{SPOTIFY_HOST}#{params}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(
      uri.request_uri,
      'Authorization' => "Bearer #{@token}"
    )

    response = http.request(request)

    tracks = JSON.load(response.body)
    tmp = tracks["tracks"]

    meta_data = tmp["items"].map do |track|
      uri = URI.parse("#{SPOTIFY_ANALYSIS}#{track["id"]}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(
        uri.request_uri,
        'Authorization' => "Bearer #{@token}"
      )
      response = http.request(request)
      JSON.parse(response.body)
    end
    meta_data
  end

  class << self
    def client
      SpotifyGetMetaData.new
    end

    def get_meta_data(type, query)
      client.get_meta_data(type, query)
    end
  end
end
