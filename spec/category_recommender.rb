require 'spec_helper'

describe CategoryRecommender do
  describe '.recommend_items' do
    it 'should recommend items based on the user purchased categories' do
      recommender = CategoryRecommender.new(35_914)
      expected = DB.category_recommender_validate

      expect(recommender.recommend_items).to eq(expected)
    end
  end
end
