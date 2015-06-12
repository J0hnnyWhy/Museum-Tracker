require('sinatra')
require('sinatra/reloader')
require('./lib/museum')
require('pry')

also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "museum_tracker"})


get('/') do
  @museums = Museum.all
  erb(:index)
end

post('/') do
  name = params.fetch("name")
  new_museum = Museum.new({:name => name, :id => nil})
  new_museum.save
  redirect back
end

get('/museums/:id') do
  @museum = Museum.find(params.fetch('id').to_i)
  erb(:museum)
end

post('/museums/:id') do
  museum_id = params.fetch('museum_id').to_i()
  description = params.fetch('description')
  artwork = Artwork.new({:description => description, :museum_id => museum_id})
  artwork.save()
  redirect back
end

patch('/museums/:id') do
  name = params.fetch('name')
  @museum = Museum.find(params.fetch('id').to_i)
  @museum.update({:name => name})
  erb(:museum)
end

delete('/') do
  @museum = Museum.find(params.fetch("id").to_i)
  @museum.delete
  @museums = Museum.all
  erb(:index)
end
