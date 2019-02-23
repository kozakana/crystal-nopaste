require "kemal"
require "./db/app_db"

def config
  config_str = File.read("config.json")
  JSON.parse(config_str)
end

get "/" do
  render "src/views/input.ecr"
end

get "/:id" do |env|
  db = AppDB.new

  id = env.params.url["id"]
  paste = db.get_paste id
  if paste.is_a?(Nil)
    env.response.status_code = 404
  else
    description = paste[:description]
    url = config["base_url"].to_s + "/" + id
    top_url = config["base_url"].to_s
    render "src/views/show.ecr"
  end
end

get "/raw/:id" do |env|
  db = AppDB.new

  paste = db.get_paste env.params.url["id"]
  if paste.is_a?(Nil)
    env.response.status_code = 404
  else
    paste[:description]
  end
end

post "/" do |env|
  db = AppDB.new

  description = env.params.body["description"].as(String)
  id = db.create_paste description
  env.redirect "/#{id}"
end

Kemal.run
