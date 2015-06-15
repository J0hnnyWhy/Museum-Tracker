require('sinatra')
require('sinatra/reloader')
require('./lib/museum')
require('./lib/artwork')
require('pry')

also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "museum_tracker"})
require('pry')

get('/') do
  @museums = Museum.all
  erb(:index)
end

post('/') do
  name = params.fetch("name")
  @museum = Museum.new({:name => name, :id => nil})
  @museum.save
  redirect back
end

get('/museums/:id') do
  @museum = Museum.find(params.fetch('id').to_i)
  erb(:museum)
end

post('/museums/:id') do
  @museum = Museum.find(params.fetch('id').to_i)
  museum_id = @museum.id
  description = params.fetch('description')
  @artwork = Artwork.new({:description => description, :museum_id => museum_id, :id => nil})
  @artwork.save()


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

get('/artworks/:id') do 
  @artwork = Artwork.find(params.fetch('id').to_i)
  @museum = Museum.find(@artwork.museum_id)
  erb(:artwork)
end

delete('/museums/:id') do
  x = params.fetch('a_id').to_i
  @artwork = Artwork.find(x)
  y = @artwork.museum_id
  @artwork.delete
  @museum = Museum.find(y)
  erb(:museum)

end
