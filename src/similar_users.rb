require 'set'

require_relative './db.rb'
require_relative './item.rb'

# Strategy class to recommend items that other users
# with similar purchases have ordered.
class SimilarUsers
  extend DB
  attr_accessor :user

  def initialize(user, similar_users)
    @user = user
    @similar_users = similar_users
  end

  def recommend_items
    recommend_items = Set.new

    @similar_users.each do |user|
      found_items = user.purchased_items - @user.purchased_items
      unless found_items.empty?
        found_items.each { |found_item| recommend_items << found_item }
      end
    end

    recommend_items
  end
end
