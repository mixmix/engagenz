class SearchesController < ApplicationController

  def index
    # @search = SearchService.new
  end

  def query
    @results = SearchService.find(search_query)
    binding.pry
  end

  private

  def search_query
    params[:search]
    # { types:  params[:types],
    #   region: params[:region] }
  end
end
