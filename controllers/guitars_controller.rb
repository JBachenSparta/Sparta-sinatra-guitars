# class GuitarController inherits from sinatra module class base
class GuitarController < Sinatra::Base

  # set the rooot of the parent directory of the current file
  #__FILE__ will give us the file we are currently in.  + .. to move back out of file.
  set :root, File.join(File.dirname(__FILE__), '..')
  #sets the views directory correctly, uses root defined^^^^
  #Proc binds views to the scope ontop of root variable.
  set :views, Proc.new{ File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

    #INDEX
    get "/" do
      @title = "Guitars"
      # @guitars = $guitars
      @guitar = Guitar.all
      erb :'guitars/index'
    end

    #NEW
    get "/new" do

      @guitar = Guitar.new

      erb :'guitars/new'

    end

    #Create
    post '/' do

      guitar = Guitar.new

      guitar.title = params[:title]
      guitar.body = params[:body]

      redirect '/'
    end

    #Show
    get "/:id" do
      id = params[:id].to_i

      @guitar = Guitar.find(id)
      erb :'guitars/show'
    end

    #Edit
    get '/:id/edit' do

      id = params[:id].to_i

      @guitar = Guitar.find(id)

      erb :'guitars/edit'
    end

    #update
    put "/:id" do
      id = params[:id].to_i

      guitar = Guitar.find(id)


      guitar.title = params[:title]
      guitar.body = params[:body]

      guitar.save

      redirect '/'

    end

    #Delete
    delete "/:id" do
      id = params[:id].to_i

      Guitar.destroy(id)

      redirect '/'
    end

end
