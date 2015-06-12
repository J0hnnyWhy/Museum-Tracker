require("spec_helper")

describe(Artwork) do
  describe(".all") do
    it("empty at first and until an object is saved") do
      artwork2 = Artwork.new({:description => 'jar', :museum_id => nil, :id => nil})
      expect(Artwork.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("is will show a list of all of the artworks") do
      artwork = Artwork.new({:description => 'blank paper', :museum_id => 1, :id => nil})
      artwork.save
      expect(Artwork.all()).to(eq([artwork]))
    end
  end

  describe('#==') do
    it('is the same list if it has the same name') do
      artwork1 = Artwork.new({:description => 'Old House', :museum_id => nil, :id => nil})
      artwork2 = Artwork.new({:description => 'Old House', :museum_id => nil, :id => nil})
      expect(artwork1).to(eq(artwork2))
    end
  end

  describe('.find') do
    it('returns art by its id') do
      test_artwork = Artwork.new({:description => 'Old House', :id => nil, :museum_id => 2})
      test_artwork.save()
      test_artwork2 = Artwork.new({:description => 'Cool Place', :id => nil, :museum_id => 3})
      test_artwork2.save()
      expect(Artwork.find(test_artwork.id())).to(eq(test_artwork))
    end
  end

end
