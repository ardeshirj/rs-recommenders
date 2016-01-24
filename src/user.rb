require_relative './db.rb'

# User information including purchase history
class User
  extend DB
  attr_accessor :id, :name

  # Many-to-many relationship with Item class.
  # purchased_items: [Item1, Item2, ItemN]
  attr_reader :purchased_items

  def initialize(id, name)
    @id = id
    @name = name
    @purchased_items = find_purchased_items unless @id.nil?
  end

  def self.find_user(id)
    row = DB.find_user(id)
    User.new(row[0].to_i, row[1])
  end

  private

  def find_purchased_items
    Item.find_purchased_items(@id)
  end
end
