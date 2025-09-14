require "net/http"
require "json"
require "uri"

class DuplicateCheckerService
  def initialize(url)
    @url = URI.parse(url)
  end

  def duplicates
    data = fetch_data
    grouped = data.group_by { |client| client["email"] }
    grouped.select { |email, clients| clients.size > 1 }
  end

  private

  def fetch_data
    response = Net::HTTP.get(@url)
    JSON.parse(response)
  end
end