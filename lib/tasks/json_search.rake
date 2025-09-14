namespace :json_search do
  desc "Search clients by name"
  task :search, [:query] => :environment do |_t, args|
    query = args[:query]
    puts "Searching clients that matches '#{query}'..." 
    results = SearchService.new("https://appassets02.shiftcare.com/manual/clients.json").search(query)
    puts results.any? ? results : "No clients found."
  end

  desc "Find duplicate emails"
  task :duplicates => :environment do
    puts "Finding email duplicates..."
    duplicates = DuplicateCheckerService.new("https://appassets02.shiftcare.com/manual/clients.json").duplicates
    if duplicates.any?
      duplicates.each do |email, clients|
        puts "Duplicate email: #{email}"
        clients.each { |client| puts " - #{client['full_name']}" }
      end
    else
      puts "No duplicate emails found."
    end
  end
end