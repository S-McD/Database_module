require "album_repository"
require "album"

RSpec.describe AlbumRepository do
    def reset_albums_table
          seed_sql = File.read('spec/seeds_albums.sql')
          connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
          connection.exec(seed_sql)
    end
        
        before(:each) do 
        reset_albums_table
        end

    it "returns 2 albums" do
        repo = AlbumRepository.new
        albums = repo.all
        expect(albums.length).to eq 2
        expect(albums.first.title).to eq 'Bossanova'
        expect(albums.first.release_year).to eq '1999'
        expect(albums.first.artist_id).to eq '1'
    end
    it "returns a specified album" do
        repo = AlbumRepository.new
        album = repo.find(1)
        expect(album.id).to eq '1'
        expect(album.title).to eq 'Bossanova'
        expect(album.release_year).to eq '1999'
        expect(album.artist_id).to eq '1'
    end
    it "returns a specified album" do
        repo = AlbumRepository.new
        album = repo.find(2)
        expect(album.id).to eq '2'
        expect(album.title).to eq 'Surfer Rosa'
        expect(album.release_year).to eq '2001'
        expect(album.artist_id).to eq '1'
    end
    it "creates a new album" do
        repository = AlbumRepository.new
        new_album = Album.new
        new_album.title = 'Trompe le Monde'
        new_album.release_year = '1991'
        new_album.artist_id = '1'
        repository.create(new_album)
        albums = repository.all
        expect(albums.last.title).to eq ('Trompe le Monde')
        expect(albums.last.release_year).to eq ('1991')
        expect(albums.last.artist_id).to eq ('1')
    end
    it "deletes an album" do
        repo = AlbumRepository.new
        repo.delete(1)
        albums = repo.all
        expect(albums.length).to eq 1
        expect(albums.first.id).to eq '2'
        expect(albums.first.title).to eq 'Surfer Rosa'
    end
    it "updates an album" do
        repo = AlbumRepository.new
        album = repo.find(2)
        album.release_year = '2000'
        repo.update(album)
        albums = repo.all
        expect(albums.last.title).to eq ('Surfer Rosa')
        expect(albums.last.release_year).to eq ('2000')
        expect(albums.last.artist_id).to eq ('1')
    end
end