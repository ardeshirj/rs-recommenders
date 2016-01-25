require 'spec_helper'

describe CategoryRecommender do
  before :all do
    user = User.find_user(35_914)

    inventory = [
      Item.find_item(1_253),
      Item.find_item(1_286),
      Item.find_item(1_423)
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
