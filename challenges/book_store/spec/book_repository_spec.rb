require "book_repository"
require "book"

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_books_table
  end
    it "calls a list of book objects" do
        repo = BookRepository.new
        books = repo.all
        expect(books.length).to eq 5
        expect(books[0].id).to eq '1'
        expect(books[1].title).to eq 'Mrs Dalloway'
        expect(books[2].author_name).to eq 'Jane Austen'
    end
end