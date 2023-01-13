class AlbumRepository
    def initialise
        @albums
    end
    def all
        @albums = []

        sql = 'SELECT id, title, release_year, artist_id FROM albums;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record| 
        album = Album.new
        album.id = record['id']
        album.title = record['title']
        album.release_year = record['release_year']
        album.artist_id = record['artist_id']

        @albums << album
        end
        return @albums
    end
    def format
        p @albums.to_s
    end
    def find(id)
        sql = 'SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;'
        sql_params = [id]
        result_set = DatabaseConnection.exec_params(sql, sql_params)

        record = result_set[0]
        album = Album.new
        album.id = record['id']
        album.title = record['title']
        album.release_year = record['release_year']
        album.artist_id = record['artist_id']

        return album
    end
    def create(album)
        sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);'
        sql_params = [album.title, album.release_year, album.artist_id]

        DatabaseConnection.exec_params(sql, sql_params)

        # return nil
    end
    def delete(id)
        sql = 'DELETE FROM albums WHERE id = $1;'
        sql_params = [id]

        DatabaseConnection.exec_params(sql, sql_params)

        # return nil
    end
    def update(album)
        sql = 'UPDATE albums SET release_year = $1 WHERE id = $2;'
        sql_params = [album.release_year, album.id]

        DatabaseConnection.exec_params(sql, sql_params)
    end
end