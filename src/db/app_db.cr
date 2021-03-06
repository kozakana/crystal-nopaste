require "./sqlite3"
require "json"

class AppDB
  @db : Sqlite3 | Nil

  def initialize
    config_str = File.read("config.json")
    config = JSON.parse(config_str)
    if config["db"]["type"] == "sqlite3"
      @db = Sqlite3.new config["db"]["url"].to_s
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
