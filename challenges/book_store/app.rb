require_relative 'lib/database_connection'
require_relative 'lib/book'
require_relative 'lib/book_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store_test')

# Perform a SQL query on the database and get the result set.

books = BookRepository.new
result = books.all

# Print out each record from the result set .
result.each do |record|
  p "#{record.id} - #{record.title} - #{record.author_name}"
end