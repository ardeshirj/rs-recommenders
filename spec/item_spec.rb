require 'item'
require 'user'

RSpec.describe Item do
  before :all do
    @item = Item.find_item(1_253)
  end

  describe '.find_item' do
    it 'should find the item matching the item id from database' do
      expected = Item.new(1_298, 'Throttle Cable')
      expect(Item.find_item(1_298)).to eq(expected)
    end
  end

  describe '.find_all_items' do
    it 'should return all items from database' do
      expect(Item.find_all_items.count).to eq(474)
    end
  end

  describe '.find_purchased_items' do
    it 'should return all items purchased by the user from database' do
      expect(Item.find_purchased_items(35_914).count).to eq(6)
    end
  end

  describe '#remove_purchased_item' do
    items = [
      Item.find_item(1_541),
      Item.find_item(1_420),
      Item.find_item(1_532),
      Item.find_item(1_253),
      Item.find_item(1_298),
      Item.find_item(1_314),
      Item.find_item(1_366)
    ]

    user = User.find_user(35_914)

    expected = [
      Item.find_item(1_541),
      Item.find_item(1_420)
    ]

    it 'should remove user purchased items from given items list' do
      expect(
        Item.remove_purchased_item(items, user.purchased_items)
      ).to eq(expected)
    end
  end

  describe '#pull_categories' do
    it 'should return the item categories' do
      expected = [
        Category.new(134, 'Bicycle Engine Kits'),
        Category.new(152, 'Gas Engine Kits')
      ]
      expect(@item.send(:pull_categories)).to eq(expected)
    end
  end
end
