# Strategy class to recommend items that other users
# with similar purchases have ordered.
class SimilarUsers
  attr_accessor :user, :recommend_items, :common_items

  def initialize
  end

  def find_similar_items
    # Get the user purchased items
    # Get all other users purchased items
    # Find the users where they bought the same items as the other user
    # Recommend what else they bought
  end
end
