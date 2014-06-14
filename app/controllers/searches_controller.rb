class SearchesController < ApplicationController

  def index
    # @search = SearchService.new
  end

  def query
    @query = search_params
    @region = Region.find( @query[:region] ).name
    # @types
    @results = SearchService.find(@query)
  end

  private

  def search_params
    { categories: params[:search][:categories],
      region:     params[:search][:region] }
  end
end
