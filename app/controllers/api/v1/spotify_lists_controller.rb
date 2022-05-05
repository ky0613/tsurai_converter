class Api::V1::SpotifyListsController < ApplicationController
  def index
    response_json = SpotifyApiClient.get_lists(params[:type], params[:query])
    render json: response_json
  end
end
