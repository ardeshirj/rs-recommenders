require 'awesome_print'

require_relative './user.rb'
require_relative './category_recommender.rb'
require_relative './similar_users.rb'
require_relative './db.rb'

extend DB

user_id = 35_914
current_user = User.find_user(user_id)

recommendation_strategy = 'SimilarUsers'

recommend_items = nil
case recommendation_strategy
when 'CategoryRecommender'
  inventory = Item.find_all_items

  recommender = CategoryRecommender.new(current_user, inventory)
  recommend_items = recommender.recommend_items
when 'SimilarUsers'
  item_ids = current_user.purchased_items.map(&:id)
  similar_users = User.similar_purchase_users(item_ids)

  recommender = SimilarUsers.new(current_user, similar_users)
  recommend_items = recommender.recommend_items
else
  puts 'Unknown recommendation strategy'
end

ap recommend_items
