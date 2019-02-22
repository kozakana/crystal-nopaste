require "kemal"
require "./db/app_db"

URL = "sqlite3://./data/sqlite.db"

get "/" do
  render "src/views/input.ecr"
end

get "/:id" do |env|
  db = AppDB.new :sqlite3, {url: URL}

  paste = db.get_paste env.params.url["id"]
  if paste.is_a?(Nil)
    env.response.status_code = 404
  else
    description = paste[:description]
    render "src/views/show.ecr"
  end
end

get "/raw/:id" do |env|
  db = AppDB.new :sqlite3, {url: URL}

  paste = db.get_paste env.params.url["id"]
  if paste.is_a?(Nil)
    env.response.status_code = 404
  else
    paste[:description]
  end
end

post "/" do |env|
  db = AppDB.new :sqlite3, {url: URL}

  description = env.params.body["description"].as(String)
  id = db.create_paste description
  env.redirect "/#{id}"
end

Kemal.run
