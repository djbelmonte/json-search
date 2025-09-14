class DuplicateCheckerService < BaseJsonService
  def duplicates
    grouped = data.group_by { |client| client["email"] }
    grouped.select { |email, clients| clients.size > 1 }
  end
end