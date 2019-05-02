class GuitarController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  #sets the views directory correctly, uses root defined^^^^
  #Proc binds views to the scope ontop of root variable.
  set :views, Proc.new{ File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader

  end

  $guitars = [{
    id: 0,
    title: "Guitar1",
    body: "This is my first post"
  },
  {
    id: 1,
    title: "Guitar2",
    body: "This is my second post"
  },
  {
    id: 2,
    title: "Guitar3",
    body: "This is my third post"
    }]

    #INDEX
    get "/" do

      @title = "this is the title of the blog"
      @guitars = $guitars
      erb :"guitars/index"
    end

    #NEW
    get "/new" do
      @guitar = {
      id: "",
      title: "",
      body: ""
      }

      @guitars = $guitars
      erb :'guitars/new'

    end

    #Create
    post "/" do
      new_guitar ={
      id: $guitars.length,
      title: params[:title],
      body: params[:body]
      }
      $guitars.push(new_guitar)
      redirect '/'
    end

    #Show
    get "/:id" do
      id = params[:id].to_i
      @guitar = $guitars[id]
      erb :'guitars/show'
    end

    #Edit
    get "/:id/edit" do
      id = params[:id].to_i
      @guitar = $guitars[id]
      erb :'guitars/edit'
    end

    #update
    put "/:id" do
      id = params[:id].to_i

      guitar = $guitars[id]

      guitar[:title] = params[:title]
      guitar[:body] = params[:body]

      $guitars[id] = guitar

      redirect '/'

    end

    #Delete
    delete "/:id" do
      id = params[:id].to_i

      $guitars.delete_at(id)

      redirect '/'
    end

end
