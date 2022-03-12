require "sinatra"

get "/" do
    "Hello World"
end

get "/person" do
    "#{params[:name]}"
end