require_relative './db.rb'
require_relative './item.rb'
require_relative './category.rb'

# Based on the purchased items, recommend items that most closely related
# based on the category similarity
class CategoryRecommender
  extend DB
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def recommend_items
    inventory = Item.find_all_items
    top_categories = Category.purchased_category(@user.purchased_items)

    found_items = []
    inventory.each do |item|
      item.categories.each do |category|
        found_items << item if top_categories.include?(category.id)
      end
    end

    found_items.uniq!
    @user.remove_purchased_item(found_items)
  end
end
