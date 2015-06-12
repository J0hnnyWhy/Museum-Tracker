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
end
