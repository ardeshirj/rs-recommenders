# User information including purchase history
class User
  attr_accessor :id, :name

  # Many-to-many relationshiop with Item class.
  attr_accessor :purchased_items

  # Arg-1: Fixnum/Bignum
  # Arg-2: String
  # Arg-3: Hash { Item => Category }
  def initialize(id, name, purchased_items)
    @id = id
    @name = name
    @purchased_items = purchased_items
  end
end
