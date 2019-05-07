require 'pg'

class Guitar
  attr_accessor(:id, :title, :body)

  #4
  #connect to database
  #this will opena aconnection to data base so we can communicate with it
  def self.open_connection
    connection = PG.connect( dbname: 'guitarpage')
  end

  def self.find(id)
    connection = self.open_connection
    sql = "SELECT * FROM guitartable WHERE id = #{id} LIMIT 1;"

    guitars = connection.exec(sql)

    guitar = self.hydrate(guitars[0])

    guitar

  end


  def self.hydrate(guitar_data)

    guitar = Guitar.new

    guitar.id = guitar_data['id']
    guitar.title = guitar_data['title']
    guitar.body = guitar_data['body']
    #last line of code is what is returned, must return post
    guitar
  end

  #method to get all the blog posts
  def self.all
    #here we execute the query that the database runs
    connection = self.open_connection
    #double quotes
    sql = "SELECT id, title, body FROM guitartable ORDER BY id"
    # sql = "SELECT * FROM guitartable INNER JOIN guitarplayer ON guitartable.title = guitarplayer.title ORDER BY id"

    #execute ^^ and get results

    #results is a pg gem object, that returns (test1) is an object
    results = connection.exec(sql)

    #map creates a new array, it will loop through results from code block, and then create post object every time for each
    guitars = results.map do |guitar|
      self.hydrate(guitar)
    #aim for self.all is to return array of post objects
    end

    guitars
  end

  def save
    connection = Guitar.open_connection
    #this gets evaulated to fault Below
    if (!self.id)
    #we call #{self.title}
      sql = "INSERT INTO guitartable(title, body) VALUES ('#{self.title}', '#{self.body}')"
    else
      sql = "UPDATE guitartable SET title='#{self.title}', body='#{self.body}' WHERE id='#{self.id}'"
    end

    connection.exec(sql)
  end

  def self.destroy(id)
    connection = self.open_connection
    sql = "DELETE FROM guitartable WHERE id = #{id}"
    connection.exec(sql)

  end


end
