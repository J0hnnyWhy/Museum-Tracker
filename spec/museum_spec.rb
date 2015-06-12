require("spec_helper")

describe(Museum) do
  describe(".all") do
    it("is will show a list of all of the museums") do
      museum1 = Museum.new({:name => 'the place', :id => nil})
      museum1.save
      museum2 = Museum.new({:name => 'new place', :id => nil})
      museum2.save
      expect(Museum.all()).to(eq(['museum1', 'museum2']))
    end
  end

  describe("#save") do
    it("is will show a list of all of the museums") do
      museum1 = Museum.new({:name => 'the place'})
      museum1.save
      expect(Museum.all()).to(eq([museum1]))
    end
  end

end
