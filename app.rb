require('sinatra')
require('sinatra/reloader')
require('./lib/museum')

also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "museum_tracker"})


get('/') do
  erb(:index)
end
