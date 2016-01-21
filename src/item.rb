# Purchaseable object
class Item
  attr_accessor :id, :name

  # Many-to-many relationshiop. In rails this can be done via
  # - has_and_belongs_to_many
  # - has_many :through
  # Also the Item can have Polymorphic Associations with
  # - User
  # - Category
  attr_accessor :purchased_by_users, :categories

  def initialize(id, name, categories)
    @name = name
    @id = id
    @categories = categories
  end
end
