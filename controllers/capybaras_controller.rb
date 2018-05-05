require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/capybara.rb' )

get '/capybaras' do
  @capybaras = Capybara.all()
  erb (:"capybaras/index")
end
#
# get '/capybaras/:id' do
#   @capybara = Capybara.find(params['id'].to_i)
#   erb(:"capybaras/show")
# end
