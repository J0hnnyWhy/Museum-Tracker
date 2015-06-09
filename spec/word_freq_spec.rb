require("rspec")
require("pg")
require("xxxxxxxxx")

DB = PG.connect({:dbname => 'xxxxxx_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM xxxx *;")
  end
end

describe(Xxxxxx) do
  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL"})
      task2 = Task.new({:description => "learn SQL"})
      expect(task1).to(eq(task2))
    end
  end
end
