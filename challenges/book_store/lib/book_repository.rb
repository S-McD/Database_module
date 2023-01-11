class BookRepository
    # Selecting all records
    # No arguments
  def all
    all_books = []

    sql = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each { |record| 
    book = Book.new
    book.id = record['id']
    book.title = record['title']
    book.author_name = record['author_name']
    all_books << book}
        return all_books
        
    # Returns an array of Book objects.
  end
end