require 'spec_helper'

describe Item do
  # item = Item.new(1157, '26 Greenline Womens BC-109')

  describe '.find_all_items' do
    it 'return all items from database' do
      expect(Item.find_all_items.count).to eq(474)
    end
  end

  describe '.find_purchased_items' do
    it 'return all items purchased by the user from database' do
      expect(Item.find_purchased_items(35_914).count).to eq(6)
    end
  end
end
