require 'json'
require 'open-uri'

class BaseJsonService
  class DataError < StandardError; end

  def initialize(url = nil, dataset: nil)
    @url = url
    @dataset = dataset # Will be used for custom inputs in test
  end

  def data
    return @dataset if @dataset # Will be used for custom inputs in test

    raise DataError, "No URL provided" unless @url

    begin
      raw = URI.open(@url).read
      parsed = JSON.parse(raw)
    rescue OpenURI::HTTPError, SocketError => e
      raise DataError, "Failed to fetch data from #{@url}: #{e.message}"
    rescue JSON::ParserError => e
      raise DataError, "Invalid JSON at #{@url}: #{e.message}"
    end

    unless parsed.is_a?(Array)
      raise DataError, "Expected array of clients, got #{parsed.class}"
    end

    parsed
  end
end