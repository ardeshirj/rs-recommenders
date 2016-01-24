require_relative './db.rb'

# User information including purchase history
class User
  attr_accessor :id, :name

  # Many-to-many relationshiop with Item class.
  # purchased_items: [Item1, Item2, ItemN]
  attr_reader :purchased_items

  def initialize(id, name)
    @id = id
    @name = name
    @purchased_items = []
  end
end
