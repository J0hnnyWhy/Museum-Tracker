require("spec_helper")

describe(Museum) do
  describe(".all") do
    it("empty at first and until an object is saved") do
      museum2 = Museum.new({:name => 'new place', :id => nil})
      expect(Museum.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("is will show a list of all of the museums") do
      museum = Museum.new({:id => 1, :name => 'the place'})
      museum.save
      expect(Museum.all()).to(eq([museum]))
    end
  end

  describe('#==') do
    it('is the same list if it has the same name') do
      museum1 = Museum.new({:name => 'Old House', :id => nil})
      museum2 = Museum.new({:name => 'Old House', :id => nil})
      expect(museum1).to(eq(museum2))
    end
  end

  describe('.find') do
    it('returns a museu by its id') do
      test_museum = Museum.new({:name => 'Old House', :id => nil})
      test_museum.save()
      test_museum2 = Museum.new({:name => 'Cool Place', :id => nil})
      test_museum2.save()
      expect(Museum.find(test_museum.id())).to(eq(test_museum))
    end
  end

  describe('#artworks') do
    it('returns an array of artworks for that list') do
      test_museum = Museum.new({:name => 'Epicodus stuff', :id => nil})
      test_museum.save()
      test_artwork = Artwork.new({:description => 'paper clip', :museum_id => test_museum.id()})
      test_artwork.save()
      test_artwork2 = Artwork.new({:description => 'booger', :museum_id => test_museum.id()})
      test_artwork2.save()
      expect(test_museum.artworks()).to(eq([test_artwork, test_artwork2]))
    end
  end



end
