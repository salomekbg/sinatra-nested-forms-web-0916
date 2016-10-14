require './environment'

module FormsLab
  class App < Sinatra::Base
  set :views, Proc.new { File.join(root, "views/pirates") }

    get '/' do
      "Welcome to the Nested Forms Lab! let's navigate to the '/new'"
    end

    get '/new' do
      erb :new
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
        params[:pirate][:ships].each do |ship|
          Ship.new(ship)
        end
      @ship_array = Ship.all
      erb :show
    end
  end
end
