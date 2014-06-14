class SearchesController < ApplicationController

  def index
    # @search = SearchService.new
  end

  def query
    @results = SearchService.find(search_params)
  end

  private

  def search_params
    { types:  params[:search][:types],
      region: params[:search][:region] }
  end
end
