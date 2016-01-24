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
  end
end
