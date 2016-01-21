# Item category
class Category
  attr_accessor :id, :name

  # Many-to-many relationshiop with Item class.
  attr_accessor :items

  def initialize(id, name)
    @id = id
    @name = name
  end
end
