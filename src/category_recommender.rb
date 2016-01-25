require_relative './db.rb'
require_relative './item.rb'
require_relative './category.rb'

# Based on the purchased items, recommend items that most closely related
# based on the category similarity
class CategoryRecommender
  extend DB
  attr_accessor :user

  def initialize(user, inventory)
    @user = user
    @inventory = inventory
  end

  def recommend_items
    categories = Category.purchased_category(@user.purchased_items)

    candidate_items = Hash.new(0)
    @inventory.each do |item|
      categories_hit = (categories & item.categories).count
      if (categories_hit > candidate_items[item]) && categories_hit != 0
        candidate_items[item] = categories_hit
      end
    end

    top_items = find_top_items(candidate_items)
    Item.remove_purchased_item(top_items, @user.purchased_items)
  end

  private

  def find_top_items(candidate_items)
    candidate_items.sort_by do |_item_id, categories_hit|
      categories_hit
    end.reverse.to_h.keys
  end
end
