require 'spec_helper'

describe User do
  describe '.find_user' do
    it 'should find the item matching the item id from database' do
      expected = User.new(35_914, 'VICTOR O')
      expect(User.find_user(35_914)).to eq(expected)
    end
  end
end
