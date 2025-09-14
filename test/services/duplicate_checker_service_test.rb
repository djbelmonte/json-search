require "test_helper"

class DuplicateCheckerServiceTest < ActiveSupport::TestCase
  setup do
    @service = DuplicateCheckerService.new("https://appassets02.shiftcare.com/manual/clients.json")
  end

  test "finds duplicate emails" do
    results = @service.duplicates
    assert_equal "jane.smith@yahoo.com", results.keys.first
    assert_equal 2, results["jane.smith@yahoo.com"].size
    assert_equal ["Jane Smith", "Another Jane Smith"], results["jane.smith@yahoo.com"].map{|client| client["full_name"]}
  end
end