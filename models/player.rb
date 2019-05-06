require 'pg'

class Player
  attr_accessor(:id, :title, :body)

  #4
  #connect to database
  #this will opena aconnection to data base so we can communicate with it
  def self.open_connection
    connection = PG.connect( dbname: 'guitarpage')
  end

  def self.find(id)
    connection = self.open_connection
    sql = "SELECT * FROM guitarplayer WHERE id = #{id} LIMIT 1"
    # sql = "SELECT * FROM guitartable;"
    # sql = "SELECT * FROM guitartable INNER JOIN guitarplayer ON guitartable.title = guitarplayer.title WHERE guitartable.id = #{id} LIMIT 1;"


    players = connection.exec(sql)

    player = self.hydrate(players[0])

    player

  end


  def self.hydrate(player_data)

    player = Player.new

    player.id = player_data['id']
    player.title = player_data['title']
    player.body = player_data['body']
    #last line of code is what is returned, must return post
    player
  end


  #method to get all the blog posts
  def self.all
    #here we execute the query that the database runs
    connection = self.open_connection
    #double quotes
    sql = "SELECT id, title, body FROM guitarplayer ORDER BY id"
    # sql = "SELECT * FROM guitartable INNER JOIN guitarplayer ON guitartable.title = guitarplayer.title ORDER BY id"

    #execute ^^ and get results

    #results is a pg gem object, that returns (test1) is an object
    results = connection.exec(sql)

    #map creates a new array, it will loop through results from code block, and then create post object every time for each
    players = results.map do |player|
      self.hydrate(player)
    #aim for self.all is to return array of post objects
    end

    players
  end

  def save
    connection = Player.open_connection
    #this gets evaulated to fault Below
    if (!self.id)
    #we call #{self.title}
      sql = "INSERT INTO guitarplayer(title, body) VALUES ('#{self.title}', '#{self.body}')"
    else
      sql = "UPDATE guitarplayer SET title='#{self.title}', body='#{self.body}' WHERE id='#{self.id}'"
    end

    connection.exec(sql)
  end

  def self.destroy(id)
    connection = self.open_connection
    sql = "DELETE FROM guitarplayer WHERE id = #{id}"
    connection.exec(sql)

  end


end
