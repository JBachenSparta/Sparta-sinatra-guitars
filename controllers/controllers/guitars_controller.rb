class PostController < Sinatra::Base


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




    get "/" do
      puts "Hello "

    end

end
