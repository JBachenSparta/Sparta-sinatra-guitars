class PlayerController < Sinatra::Base

  # set the rooot of the parent directory of the current file
  #__FILE__ will give us the file we are currently in.  + .. to ove back out of file.
  set :root, File.join(File.dirname(__FILE__), '..')
  #sets the views directory correctly, uses root defined^^^^
  #Proc binds views to the scope ontop of root variable.
  set :views, Proc.new{ File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

    #INDEX
    get "/players" do

      @title = "Guitar Players"
      # # @player = $players
      @player = Player.all
      erb :"players/index"
    end

    # #NEW
    get "/players/new" do

      @player = Player.new
      # #calls new page, which calls form.erb which calls ^^^^^^ above code
      erb :'players/new'

    end
    #
    #Create
    post '/players' do

      player = Player.new

      player.title = params[:title]
      player.body = params[:body]
      player.save

      redirect '/players'
    end

    #Show
    get "/players/:id" do
      id = params[:id].to_i

      # @guitar = $guitars[id]
      @player = Player.find(id)
      erb :'players/show'
    end

    #Edit
    get "/players/:id/edit" do
      id = params[:id].to_i
      # @guitar = $guitars[id]
      @player = Player.find(id)
      erb :'players/edit'
    end

    #update
    put "/players/:id" do
      id = params[:id].to_i

      player = Player.find(id)

      player.title = params[:title]
      player.body = params[:body]
      player.save

      redirect '/players'

    end

    #Delete
    delete "/players/:id" do
      id = params[:id].to_i

      Player.destroy(id)

      redirect '/players'
    end

end
