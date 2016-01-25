require_relative './db.rb'
require_relative './item.rb'

# Strategy class to recommend items that other users
# with similar purchases have ordered.
class SimilarUsers
  extend DB
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def find_similar_items
    item_ids = @user.purchased_items.map(&:id)

    # Find users who bought the same items
    similar_users = User.similar_purchase_users(item_ids)

    item_users = items_purchased_by_user(similar_users)
    user_recommends = user_item_recommendations(item_users)

    user_recommends
  end

  private

  def items_purchased_by_user(similar_users)
    # Create a Hash where the key is the item
    # and the value is list of users who bought that item
    item_users = Hash.new { |item, users| item[users] = [] }
    similar_users.each do |user|
      user.purchased_items.each do |item|
        item_users[item] << user
      end
    end

    item_users
  end

  def user_item_recommendations
    # Create a Hash where the key is the user
    # and the value is the list of items suggested for the user
    user_recommends = Hash.new do |user, recommend_item|
      user[recommend_item] = []
    end
    similar_users.each do |similar_user|
      item_users.each_pair do |item, user|
        # If the item has not been purchased by the user then suggest it
        user_recommends[similar_user] << item unless user.include?(similar_user)
      end
    end

    user_recommends
  end
end
