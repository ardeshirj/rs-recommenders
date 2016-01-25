require 'spec_helper'

describe CategoryRecommender do
  before :all do
    user = User.find_user(35_914)
    # user category_ids = [134, 152, 133, 129, 164, 168, 154]
    # user item_ids     = [1253, 1532, 1532, 1298, 1314, 1366]

    inventory = [
      Item.find_item(1_423),  # category_ids = [154, 164, 168]
      Item.find_item(1_286),  # category_ids = [168]
      Item.find_item(1_253),  # category_ids = [134, 152]
      Item.find_item(1_170)   # category_ids = [172]
    ]

    @recommender = CategoryRecommender.new(user, inventory)
  end

  describe '.recommend_items' do
    it 'should recommend items based on the user purchased categories' do
      expected = [Item.find_item(1_423), Item.find_item(1_286)]
      expect(@recommender.recommend_items).to eq(expected)
    end
  end
end
