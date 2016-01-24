# Item category
class Category
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.purchased_category(purchased_items)
    categories = []
    purchased_items.each do |purchased_item|
      purchased_item.categories.each do |category|
        categories << category
      end
    end
    categories.uniq!(&:id)
  end

  def ==(other)
    @id == other.id
  end

  def eql?(other)
    @id == other.id
  end

  def hash
    @id.hash
  end
end
