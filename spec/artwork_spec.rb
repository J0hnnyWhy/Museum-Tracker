require("spec_helper")

describe(Artwork) do
  describe(".all") do
    it("empty at first and until an object is saved") do
      artwork2 = Artwork.new({:description => 'jar', :id => nil})
      expect(Artwork.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("is will show a list of all of the artworks") do
      artwork = Artwork.new({:id => 1, :description => 'blank paper'})
      artwork.save
      expect(Artwork.all()).to(eq([artwork]))
    end
  end

  describe('#==') do
    it('is the same list if it has the same name') do
      artwork1 = Artwork.new({:description => 'Old House', :id => nil})
      artwork2 = Artwork.new({:description => 'Old House', :id => nil})
      expect(artwork1).to(eq(artwork2))
    end
  end

  describe('.find') do
  it('returns a museu by its id') do
    test_artwork = Artwork.new({:description => 'Old House', :id => nil})
    test_artwork.save()
    test_artwork2 = Artwork.new({:description => 'Cool Place', :id => nil})
    test_artwork2.save()
    expect(Artwork.find(test_artwork.id())).to(eq(test_artwork))
  end
end
end
