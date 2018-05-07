require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/capybara.rb' )

get '/capybaras' do
  @capybaras = Capybara.all()
  erb (:"capybaras/index")
end
