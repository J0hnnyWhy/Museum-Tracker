require('sinatra')
require('sinatra/reloader')
require('./lib/xxxxx')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
