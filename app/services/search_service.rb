class SearchService < BaseJsonService
  def search(query)
    data.select { |client| client["full_name"].downcase.include?(query.downcase) }
  end
end