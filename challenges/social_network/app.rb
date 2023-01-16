require_relative 'lib/database_connection'
require_relative "lib/account"
require_relative "lib/account_repository"
require_relative "lib/post"
require_relative "lib/post_repository"

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_network')

# Perform a SQL query on the database and get the result set.
account_repo = AccountRepository.new
post_repo = PostRepository.new

# Print out each record from the result set .
account_repo.all.each do |record|
  p record
end
post_repo.all.each do |record|
    p record
end