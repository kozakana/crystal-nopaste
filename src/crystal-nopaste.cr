#require "./crystal-nopaste/*"
#
## TODO: Write documentation for `Crystal::Nopaste`
#module Crystal::Nopaste
#  # TODO: Put your code here
#end

require "kemal"

get "/" do
  "Hello World!"
end

Kemal.run
