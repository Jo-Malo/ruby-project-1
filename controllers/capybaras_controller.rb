require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/capybara.rb' )


get '/capybaras' do
  @capybaras = Capybara.all()
  erb (:"capybaras/index")
end

get '/capybaras/:id' do
  @capybara = Capybara.find(params['id'].to_i)
  erb(:"capybaras/show")
end

get '/capybaras/:id/edit' do
  @capybara = Capybara.find(params['id'].to_i)
  erb(:"capybaras/edit")
end

post '/capybaras/:id' do
  capybara = Capybara.new(params)
  capybara.update
  redirect to "/capybaras/#{params['id']}"
end

get '/capybara/homeless' do
  @capybaras = Capybara.available()
  erb (:"capybaras/avail_show")
end

get '/capybara/rehomed' do
  @capybaras = Capybara.unavailable()
  erb (:"capybaras/unavail_show")
end
