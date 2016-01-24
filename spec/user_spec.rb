require 'spec_helper'

describe User do
  user = User.find_user(35_914)

  describe '.find_user' do
    it 'should find the item matching the item id from database' do
      expected = User.new(35_914, 'VICTOR O')
      expect(User.find_user(35_914)).to eq(expected)
    end
  end

  describe '#remove_purchased_item' do
    items = [
      Item.find_item(1_253),
      Item.find_item(1_532),
      Item.find_item(1_253),
      Item.find_item(1_366)
    ]

    expected = [
      Item.find_item(1_298),
      Item.find_item(1_314)
    ]

    it 'should remove given items from user purchased items list' do
      expect(user.remove_purchased_item(items)).to eq(expected)
    end
  end
end
