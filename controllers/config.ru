require 'sinatra'
require 'sinatra/contrib' #the reloader package
require_relative './controllers/guitars_controller'

run PostController
