class Artwork
  attr_reader(:description, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
  end
  define_singleton_method(:all) do
    returned_artworks = DB.exec('SELECT * FROM artworks;')
    artworks = []
    returned_artworks.each() do |artwork|
      description = artwork.fetch('description')
      id = artwork.fetch('id').to_i()
      artworks.push(Artwork.new({:description => description, :id => id}))
    end
    artworks
  end
  define_method(:save) do
    result = DB.exec("INSERT INTO artworks (description) VALUES ('#{@description}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end
  define_method(:==) do |another_artwork|
    self.description().==(another_artwork.description()).&(self.id().==(another_artwork.id()))
  end
end
