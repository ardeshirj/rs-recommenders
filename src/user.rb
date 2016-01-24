require_relative './db.rb'
require_relative './item.rb'

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

  def remove_purchased_item(items)
    purchased_items.delete_if do |item|
      items.include?(item)
    end
  end

  def self.find_user(user_id)
    row = DB.find_user(user_id)
    User.new(row[0].to_i, row[1])
  end

  def ==(other)
    @id == other.id
  end

  private

  def find_purchased_items
    Item.find_purchased_items(@id)
  end
end
