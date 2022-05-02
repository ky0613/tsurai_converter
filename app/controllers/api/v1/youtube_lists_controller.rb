class Api::V1::YoutubeListsController < ApplicationController
  def index
    response_json = YoutubeApiClient.get_lists
    render json: response_json
  end
end
