require_relative './user.rb'
require_relative './category_recommender.rb'
require_relative './similar_users.rb'

if ARGV.empty? || ARGV.size < 2
  puts 'Usage: main.rb use_id strategy'
  puts 'Strategies - Enter a number:'
  puts "\t [0]: Category Recommender"
  puts "\t [1]: Similar Users"
  exit
end

user = nil
strategy = nil
strategies = %w(
  CategoryRecommender
  SimilarUsers
)

begin
  user = User.find_user(ARGV[0].to_i)
  strategy = strategies.fetch(ARGV[1].to_i)
rescue ArgumentError
  puts 'No user found!'
  exit
rescue IndexError
  puts 'Not a valid Strategy numeric value '
  exit
end

recommend_items = nil
case strategy
when 'CategoryRecommender'
  inventory = Item.find_all_items

  recommender = CategoryRecommender.new(user, inventory)
  recommend_items = recommender.recommend_items
when 'SimilarUsers'
  similar_users = user.similar_purchase_users

  recommender = SimilarUsers.new(user, similar_users)
  recommend_items = recommender.recommend_items
else
  fail 'Unknown strategy'
end

recommend_items.each { |item| puts item.name }
