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
  erb (:"capybaras/homeless_show")
end

get '/capybara/rehomed' do
  @capybaras = Capybara.unavailable()
  erb (:"capybaras/rehomed_show")
end

get '/capybara/new' do
  @capybaras = Capybara.all()
  erb( :"capybaras/new" )
end

post '/capybara/new' do
  new_capybara = Capybara.new(params)
  new_capybara.save()
  redirect to('/capybaras')
end
# just added
post '/capybaras/:id/delete' do
  capybara = Capybara.find(params['id'])
  capybara.delete
  redirect to("/capybaras")
end
