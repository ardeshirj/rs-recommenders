require 'sqlite3'

# Module to connect to db
module DB
  DB_PATH = File.expand_path('../../rs-db', __FILE__)

  def self.find_user(user_id)
    db = SQLite3::Database.open DB_PATH
    db.get_first_row("SELECT * FROM user WHERE user_id = #{user_id}")
  rescue SQLite3::Exception => e
    puts e
  rescue
    db.close if db
  end
end
