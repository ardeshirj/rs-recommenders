require 'sqlite3'

# Module to connect to db
module DB
  DB_PATH = File.expand_path('../../rs-data.db', __FILE__)

  def self.find_user(user_id)
    db = SQLite3::Database.open DB_PATH
    sql = ('SELECT * FROM user WHERE user_id = :user_id')
    db.get_first_row(sql, user_id)
  rescue SQLite3::Exception => e
    puts e
  ensure
    db.close
  end

  def self.find_item(item_id)
    db = SQLite3::Database.open DB_PATH
    sql = 'SELECT * FROM item WHERE item_id = :item_id'
    db.get_first_row(sql, item_id)
  rescue SQLite3::Exception => e
    puts e
  ensure
    db.close
  end

  def self.find_similar_purchase_users(item_ids)
    db = SQLite3::Database.open DB_PATH
    db.execute("SELECT DISTINCT(u.user_id), u.name
      FROM item_user iu, user u
      WHERE iu.user_id = u.user_id
      AND iu.item_id IN (#{item_ids.join(', ')})")
  rescue SQLite3::Exception => e
    puts e
  ensure
    db.close
  end

  def self.all_items
    db = SQLite3::Database.open DB_PATH
    db.execute('SELECT * FROM item')
  rescue SQLite3::Exception => e
    puts e
  ensure
    db.close
  end

  def self.user_purchased_items(user_id)
    db = SQLite3::Database.open DB_PATH
    sql = "SELECT i.item_id, i.name
      FROM item_user iu, item i
      WHERE iu.item_id = i.item_id
      AND iu.user_id = :user_id"
    db.execute(sql, user_id)
  rescue SQLite3::Exception => e
    puts e
  ensure
    db.close
  end

  def self.item_categories(item_id)
    db = SQLite3::Database.open DB_PATH
    sql = 'SELECT c.category_id, c.name
      FROM item_category ic, category c
      WHERE ic.category_id = c.category_id
      AND ic.item_id = :item_id'
    db.execute(sql, item_id)
  rescue SQLite3::Exception => e
    puts e
  ensure
    db.close
  end
end
