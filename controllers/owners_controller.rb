require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/owner.rb')
require_relative('../models/capybara.rb')


get '/owners' do
  @owners = Owner.all()
  erb(:"owners/index")
end

get '/owners/:id' do
  @owner = Owner.find(params['id'].to_i)
  erb( :"owners/show" )
end

get '/owner/new' do
  @capybaras = Capybara.all()
  erb( :"owners/new" )
end

post '/owner/new' do
  new_owner = Owner.new(params)
  new_owner.save()
  redirect to('/owners')
end

get '/owner/:id/adopt' do

end
