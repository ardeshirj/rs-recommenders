require 'user'

RSpec.describe User do
  before :all do
    @user = User.find_user(84_484)
  end

  describe '.find_user' do
    it 'should return the user matching the item id from database' do
      expected = User.new(35_914, 'VICTOR O')
      expect(User.find_user(35_914)).to eq(expected)
    end
  end

  describe '.similar_purchase_users' do
    it 'should find all the other user who bought the same items' do
      expect(@user.similar_purchase_users.count).to eq(982)
    end
  end

  describe '#pull_purchased_items' do
    it 'should return items the user purchased' do
      expected = [Item.find_item(1532)]
      expect(@user.send(:pull_purchased_items)).to eq(expected)
    end
  end
end
