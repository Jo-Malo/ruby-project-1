require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/capybaras_controller')

get '/' do
  erb( :index )
end
