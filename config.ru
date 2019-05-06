require 'sinatra'
require 'sinatra/contrib' #the reloader package
require 'pg'


require_relative './models/guitar'
require_relative './controllers/guitars_controller'
# this class is run as middleware
require_relative './controllers/players_controller'


#Middle ware allows form method value overwritten
use Rack::MethodOverride

# use PlayersController
run GuitarController
