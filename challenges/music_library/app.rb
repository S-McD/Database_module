require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/artist'
require_relative 'lib/album_repository'
require_relative 'lib/album'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run

    @io.puts "Welcome to the music library manager!\n "
    @io.puts"What would you like to do?\n1 - List all albums\n2 - List all artists"
    @io.puts"Enter your choice: "
    

    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end
# We need to give the database name to the method `connect`.
# DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
# artist_repository = ArtistRepository.new
# album_repository = AlbumRepository.new

# Print out each record from the result set

# artist_repository.all.each do |artist|
#   p artist
# end

# album_repository.all.each do |album|
#   p album
#   # p "#{album.id}, #{album.title}, "
# end

# album = album_repository.find(3)
# p album
# "#{album.title}, #{album.release_year}"
