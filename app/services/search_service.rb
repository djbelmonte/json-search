require "net/http"
require "json"
require "uri"

class SearchService
  def initialize(url)
    @url = URI.parse(url)
  end

  def search(query)
    data = fetch_data
    data.select { |client| client["full_name"].downcase.include?(query.downcase) }
  end

  private

  def fetch_data
    response = Net::HTTP.get(@url)
    JSON.parse(response)
  end
end