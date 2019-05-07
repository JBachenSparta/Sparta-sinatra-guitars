require 'sinatra'
require 'sinatra/contrib' #the reloader package
require 'pg'


require_relative './models/guitar'
require_relative './models/player'
require_relative './models/book'
require_relative './controllers/guitars_controller'
# this class is run as middleware
require_relative './controllers/players_controller'
require_relative './controllers/books_controller'


#Middle ware allows form method value overwritten
use Rack::MethodOverride

use PlayerController
use BookController
run GuitarController

# map('/players') { run PlayerController }
# map('/') { run GuitarController }


# maps = {
#   '/' => GuitarController,
#   '/players' => PlayerController
# }
#
# maps.each do |path, controller|
#   map(path){ run controller}
# end
