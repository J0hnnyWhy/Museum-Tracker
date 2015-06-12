require("rspec")
require("pg")
require("museum")

DB = PG.connect({:dbname => 'museum_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM museums *;")
  end
end

describe(Museum) do
  describe(".all) do
    it("is will show a list of all of the museums") do
      museum1 = Museum.new({:name => "the place"})
      museum2 = Museum.new({:name => "new place"})
      expect(Museum.all()).to(eq(['museum1', 'museum2']))
    end
  end
end
