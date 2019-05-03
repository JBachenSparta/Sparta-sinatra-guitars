require 'sinatra'
require 'sinatra/contrib' #the reloader package
require_relative './controllers/guitars_controller'

#Middle ware allows form method value overwritten
use Rack::MethodOverride

run GuitarController
