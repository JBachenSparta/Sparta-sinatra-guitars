require 'sinatra'
require 'sinatra/contrib' #the reloader package
require_relative './controllers/guitars_controller'

use Rack::MethodOverride

run PostController
