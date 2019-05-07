require 'pg'

class Book
  attr_accessor(:id, :title, :author)

  #4
  #connect to database
  #this will opena aconnection to data base so we can communicate with it
  def self.open_connection
    connection = PG.connect( dbname: 'guitarpage')
  end

  def self.find(id)
    connection = self.open_connection
    sql = "SELECT * FROM bookstable WHERE id = #{id} LIMIT 1"
    # sql = "SELECT * FROM guitartable;"
    # sql = "SELECT * FROM guitartable INNER JOIN guitarplayer ON guitartable.title = guitarplayer.title WHERE guitartable.id = #{id} LIMIT 1;"

    books = connection.exec(sql)
    # puts books

    book = self.hydrate(books[0])

    book

  end


  def self.hydrate(book_data)

    book = Book.new

    book.id = book_data['id']
    book.title = book_data['title']
    book.author = book_data['author']
    #last line of code is what is returned, must return post
    book
  end

  #method to get all the blog posts
  def self.all
    #here we execute the query that the database runs
    connection = self.open_connection
    #double quotes
    sql = "SELECT id, title, author FROM bookstable ORDER BY id"
    # sql = "SELECT * FROM guitartable INNER JOIN guitarplayer ON guitartable.title = guitarplayer.title ORDER BY id"

    #execute ^^ and get results

    #results is a pg gem object, that returns (test1) is an object
    results = connection.exec(sql)

    #map creates a new array, it will loop through results from code block, and then create post object every time for each
    books = results.map do |book|
      self.hydrate(book)
    #aim for self.all is to return array of post objects
    end

    books
  end

  def save
    connection = Book.open_connection
    #this gets evaulated to fault Below
    if (!self.id)
    #we call #{self.title}
      sql = "INSERT INTO bookstable(title, author) VALUES ('#{self.title}', '#{self.author}')"
    else
      sql = "UPDATE bookstable SET title='#{self.title}', author='#{self.author}' WHERE id='#{self.id}'"
    end

    connection.exec(sql)
  end

  def self.destroy(id)
    connection = self.open_connection
    sql = "DELETE FROM bookstable WHERE id = #{id}"
    connection.exec(sql)

  end


end
