require 'awesome_print'

require_relative './user.rb'
require_relative './category_recommender.rb'
require_relative './similar_users.rb'
require_relative './db.rb'

extend DB

user_id = 35_914
current_user = User.find_user(user_id)

recommendation_strategy = 'CategoryRecommender'

recommend_items = nil
case recommendation_strategy
when 'CategoryRecommender'
  inventory = Item.find_all_items
  recommender = CategoryRecommender.new(current_user, inventory)
  recommend_items = recommender.recommend_items
when 'SimilarUsers'
  recommender = SimilarUsers.new(current_user)
  recommend_items = recommender.find_similar_items
else
  puts 'Unknown recommendation strategy'
end

ap recommend_items
