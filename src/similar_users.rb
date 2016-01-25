require 'set'

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
    recommend_items = Set.new
    item_ids = @user.purchased_items.map(&:id)
    similar_users = User.similar_purchase_users(item_ids)

    similar_users.each do |user|
      found_items = user.purchased_items - @user.purchased_items
      unless found_items.empty?
        found_items.each { |found_item| recommend_items << found_item }
      end
    end

    recommend_items
  end
end
