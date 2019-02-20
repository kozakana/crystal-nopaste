require "kemal"

get "/" do
  render "src/views/input.ecr"
end

get "/:id" do
  render "src/views/show.ecr"
end

get "/raw/:id" do |env|
  env.params.url["id"]
end

post "/" do |env|
  env.params.body["description"].as(String)
  #env.redirect "/"
end

Kemal.run
