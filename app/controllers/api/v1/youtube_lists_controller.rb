class Api::V1::YoutubeListsController < ApplicationController
  def index
    response_json = YoutubeApiClient.get_lists(params[:query])
    render json: response_json
  end
end
