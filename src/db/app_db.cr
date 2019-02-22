require "./sqlite3"

class AppDB
  @db : Sqlite3 | Nil

  def initialize(type : Symbol, option)
    if type == :sqlite3
      @db = Sqlite3.new option[:url]
    end
  end

  def create_db
    @db.not_nil!.create_db
  end

  def get_paste(id : String)
    @db.not_nil!.get_paste id
  end

  def create_paste(description : String)
    @db.not_nil!.create_paste description
  end

  def close
    @db.not_nil!.close
  end
end
