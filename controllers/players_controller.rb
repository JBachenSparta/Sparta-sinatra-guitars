class PlayersController < Sinatra::Base

  # set the rooot of the parent directory of the current file
  #__FILE__ will give us the file we are currently in.  + .. to ove back out of file.
  set :root, File.join(File.dirname(__FILE__), '..')
  #sets the views directory correctly, uses root defined^^^^
  #Proc binds views to the scope ontop of root variable.
  set :views, Proc.new{ File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  #globally defined variable as an array of hashes
  # $guitars = [{
  #   id: 0,
  #   title: "Guitar1",
  #   body: "This is my first post"
  # },
  # {
  #   id: 1,
  #   title: "Guitar2",
  #   body: "This is my second post"
  # },
  # {
  #   id: 2,
  #   title: "Guitar3",
  #   body: "This is my third post"
  #   }]

    #INDEX
    get "/players/" do
      # route = env["sinatra.route"]
      # response = {:endpoint => route}
      @title = "this is the title of the blog"
      # @guitars = $guitars
      @guitar = Guitar.all
      erb :"players/index"
    end

    #NEW
    get "/players/new" do
      # @guitar = {
      # id: "",
      # title: "",
      # body: ""
      # }
      #
      # @guitars = $guitars
      @player = Player.new
      #calls new page, which calls form.erb which calls ^^^^^^ above code
      erb :'guitars/new'

    end

    #Create
    post '/' do
      # new_guitar ={
      # id: $guitars.length,
      # title: params[:title],
      # body: params[:body]
      # }
      # $guitars.push(new_guitar)

      guitar = Guitar.new

      guitar.title = params[:title]
      guitar.body = params[:body]

      #save the posts
      # run an instance method on this instance of create
      guitar.save

      redirect '/'
    end

    #Show
    get "/:id" do
      id = params[:id].to_i

      # @guitar = $guitars[id]
      @guitar = Guitar.find(id)
      erb :'guitars/show'
    end

    #Edit
    get "/:id/edit" do
      id = params[:id].to_i
      # @guitar = $guitars[id]
      @guitar = Guitar.find(id)
      erb :'guitars/edit'
    end

    #update
    put "/:id" do
      id = params[:id].to_i

      # @guitar = $guitars[id]
      guitar = Guitar.find(id)


      guitar.title = params[:title]
      guitar.body = params[:body]

      # @guitar[:title] = params[:title]
      # @guitar[:body] = params[:body]

      # $guitars[id] = @guitar

      guitar.save

      redirect '/'

    end

    #Delete
    delete "/:id" do
      id = params[:id].to_i

      # $guitars.delete_at(id)

      Guitar.destroy(id)

      redirect '/'
    end

end
