require('sinatra')
require('sinatra/reloader')
require('./lib/xxxxx')

also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "xxxxxxx"})


get('/') do
  erb(:index)
end
