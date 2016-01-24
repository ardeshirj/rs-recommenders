# Purchaseable object
class Item
  attr_accessor :id, :name

  # Many-to-many relationshiop with Category class.
  # categories: [Category1, Category2, CategoryN]
  attr_reader :categories

  def initialize(id, name)
    @id = id
    @name = name
    @categories = []
  end
end
