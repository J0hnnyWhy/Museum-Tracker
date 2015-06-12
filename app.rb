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
  @museums = Museum.all
  redirect back
end
