require("spec_helper")

describe(Artwork) do
  describe(".all") do
    it("empty at first and until an object is saved") do
      artwork2 = Artwork.new({:description => 'jar', :museum_id => nil})
      expect(Artwork.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("is will show a list of all of the artworks") do
      artwork = Artwork.new({:description => 'blank paper', :museum_id => 1})
      artwork.save
      expect(Artwork.all()).to(eq([artwork]))
    end
  end

  describe('#==') do
    it('is the same list if it has the same name') do
      artwork1 = Artwork.new({:description => 'Old House', :museum_id => nil})
      artwork2 = Artwork.new({:description => 'Old House', :museum_id => nil})
      expect(artwork1).to(eq(artwork2))
    end
  end

end
