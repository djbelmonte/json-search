require 'test_helper'

class BaseJsonServiceTest < ActiveSupport::TestCase
  class TestService < BaseJsonService; end

  test "raises error if no URL or custom dataset provided" do
    service = TestService.new(nil)
    assert_raises(BaseJsonService::DataError) { service.data }
  end

  test "raises error if JSON is invalid" do
    url = "https://appassets02.shiftcare.com/manual/wrongurl.json"
    service = TestService.new(url)
    assert_raises(BaseJsonService::DataError) { service.data }
  end

  test "raises error if JSON is not an array" do
    url = "https://github.com/djbelmonte/json-search/blob/main/test/data/json/test.json"
    service = TestService.new(url)
    assert_raises(BaseJsonService::DataError) { service.data }
  end
end