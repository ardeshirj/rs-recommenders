# Item category
class Category
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.purchased_category(purchased_items)
    categories_hits = Hash.new(0)
    purchased_items.each do |item|
      item.categories.each do |category|
        categories_hits[category.id] += 1
      end
    end
    categories_hits.sort_by do |_category_id, hits|
      hits
    end.reverse.to_h.keys
  end
end
