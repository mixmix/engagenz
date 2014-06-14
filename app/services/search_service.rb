class SearchService
  def self.find(types: nil, region: nil)
    Provider.where(region_id: region).all
  end


end