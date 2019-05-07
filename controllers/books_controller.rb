# class GuitarController inherits from sinatra module class base
class BookController < Sinatra::Base

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
    get "/books" do
      @title = "Books"
      # @guitars = $guitars
      @book = Book.all
      erb :'books/index'
    end

    #NEW
    get "/books/new" do

      @book = Book.new

      erb :'books/new'

    end

    #Create
    post '/books' do

      book = Book.new

      book.title = params[:title]
      book.author = params[:author]

      book.save

      redirect '/books'
    end

    #Show
    get "/books/:id" do
      id = params[:id].to_i

      @book = Book.find(id)
      erb :'books/show'
    end

    #Edit
    get '/books/:id/edit' do

      id = params[:id].to_i

      @book = Book.find(id)


      erb :'books/edit'
    end

    #update
    put "/books/:id" do
      id = params[:id].to_i

      # @guitar = $guitars[id]
      book = Book.find(id)


      book.title = params[:title]
      book.author = params[:author]

      book.save

      redirect '/books'

    end

    #Delete
    delete "/books/:id" do
      id = params[:id].to_i

      Book.destroy(id)

      redirect '/books'
    end

end
