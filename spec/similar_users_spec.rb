require 'similar_users'

RSpec.describe SimilarUsers do
  before :all do
    user = User.find_user(35_914)
    # user item_ids = [1253, 1532, 1298, 1314, 1366]

    similar_users = [
      User.find_user(143_554), # item_ids = [1253, 1301]
      User.find_user(158_241)  # item_ids = [1298]
    ]

    @recommender = SimilarUsers.new(user, similar_users)
  end

  describe '.recommend_items' do
    it 'should recommend item from other users with similar purchases' do
      expected = Set.new [Item.find_item(1301)]
      expect(@recommender.recommend_items).to eq(expected)
    end
  end
end
