require('sinatra')
require('sinatra/reloader')
require('./lib/museum')
require('./lib/artwork')
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
  id = params.fetch('id').to_i
  artwork = Artwork.new({:description => description, :museum_id => museum_id, :id => id})
  artwork.save()
  @museum = Museum.find(id)
  erb(:museum)
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

delete('/museums/:id') do
  @art = Artwork.find(params.fetch("art_id").to_i)
  @art.delete
  redirect back
end
