require "test_helper"

class SearchServiceTest < ActiveSupport::TestCase
  setup do
    @service = SearchService.new("https://appassets02.shiftcare.com/manual/clients.json")
  end

  test "finds clients by full_name" do
    test_cases = {
      "john" => [{"id"=>1, "full_name"=>"John Doe", "email"=>"john.doe@gmail.com"}, {"id"=>3, "full_name"=>"Alex Johnson", "email"=>"alex.johnson@hotmail.com"}],
      "michael" => [{"id"=>4, "full_name"=>"Michael Williams", "email"=>"michael.williams@outlook.com"}, {"id"=>10, "full_name"=>"Michael Brown", "email"=>"michael.brown@inbox.com"}],
      "will" => [{"id"=>4, "full_name"=>"Michael Williams", "email"=>"michael.williams@outlook.com"}, {"id"=>6, "full_name"=>"William Davis", "email"=>"william.davis@icloud.com"}]
    }
    
    test_cases.each do |query, expected|
      results = @service.search(query)
      assert_equal expected.size, results.size
      assert_equal expected, results
    end
  end

  test "returns empty when no match" do
    results = @service.search("abcdef")
    assert_empty results
  end
end