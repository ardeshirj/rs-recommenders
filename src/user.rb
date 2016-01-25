require_relative './db.rb'
require_relative './item.rb'

# User information including purchase history
class User
  extend DB

  attr_accessor :id, :name
  attr_reader :purchased_items

  def initialize(id, name)
    @id = id
    @name = name
    @purchased_items = pull_purchased_items unless @id.nil?
  end

  def self.find_user(user_id)
    row = DB.find_user(user_id)
    User.new(row[0].to_i, row[1])
  end

  def similar_purchase_users
    item_ids = @purchased_items.map(&:id)
    db_items = DB.find_similar_purchase_users(item_ids)
    db_items.map do |row|
      User.new(row[0].to_i, row[1])
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

  def pull_purchased_items
    Item.find_purchased_items(@id)
  end
end
