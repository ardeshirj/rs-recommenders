require_relative './db.rb'
require_relative './category.rb'

# Purchasable object
class Item
  extend DB

  attr_accessor :id, :name
  attr_reader :categories

  def initialize(id, name)
    @id = id
    @name = name
    @categories = pull_categories unless @id.nil?
  end

  def self.find_item(item_id)
    row = DB.find_item(item_id)
    Item.new(row[0].to_i, row[1])
  end

  def self.find_all_items
    db_items = DB.all_items
    db_items.map do |row|
      Item.new(row[0].to_i, row[1])
    end
  end

  def self.find_purchased_items(user_id)
    db_items = DB.user_purchased_items(user_id)
    db_items.map do |row|
      Item.new(row[0].to_i, row[1])
    end
  end

  def self.remove_purchased_item(items, purchased_items)
    items.delete_if do |item|
      purchased_items.include?(item)
    end
  end

  def ==(other)
    @id == other.id
  end

  def eql?(other)
    @id == other.id
  end

  def hash
    @id.hash
  end

  private

  def pull_categories
    item_categories = []
    DB.item_categories(@id).each do |row|
      item_categories << Category.new(row[0].to_i, row[1])
    end
    item_categories
  end
end
