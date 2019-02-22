require "sqlite3"

class Sqlite3
  @db : DB::Database

  def initialize(url)
    @db = DB.open url
  end

  def create_db
    @db.exec "CREATE TABLE paste (id INT PRIMARY KEY, description TEXT NOT NULL, created_at DATETIME)"
    # TODO: unique, created_at index
  end

  def get_paste(id : String)
    begin
      description, created_at =
        @db.query_one "SELECT description, created_at FROM paste WHERE id = ? LIMIT 1", id, as: {String, Time}
    rescue e : DB::Error
      return nil
    end

    {id: id, description: description, created_at: created_at}
  end

  def create_paste(description : String)
    id = Random::Secure.urlsafe_base64
    @db.exec "INSERT INTO paste VALUES (?, ?, ?)", id, description, Time.now
    id
  end

  def close
    @db.close
  end
end
