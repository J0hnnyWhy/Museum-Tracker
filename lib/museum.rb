class Museum
  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_museums = DB.exec("SELECT * FROM museums;")
    museums = []
    returned_museums.each() do |museum|
      name = museum.fetch("name")
      museums.push(Museum.new({:name => name}))
    end
    museums
  end
end
