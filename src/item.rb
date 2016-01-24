require_relative './db.rb'

# Purchaseable object
class Item
  extend DB

  attr_accessor :id, :name

  # Many-to-many relationshiop with Category class.
  # categories: [Category1, Category2, CategoryN]
  attr_reader :categories

  def initialize(id, name)
    @id = id
    @name = name
    @categories = find_categories unless @id.nil?
  end

  def self.find_purchased_items(user_id)
    db_items = DB.user_purchased_items(user_id)
    db_items.map do |row|
      Item.new(row[0].to_i, row[1])
    end
  end

  def self.find_all_items
    db_items = DB.all_items
    db_items.map do |row|
      Item.new(row[0].to_i, row[1])
    end
  end

  private

  def find_categories
    item_categories = []
    DB.item_categories(@id).each do |row|
      item_categories << Category.new(row[0].to_i, row[1])
    end
    item_categories
  end
end
