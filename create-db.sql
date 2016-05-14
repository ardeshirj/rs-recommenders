CREATE TABLE item (item_id INTEGER, name TEXT);
CREATE TABLE user (user_id INTEGER, name TEXT);
CREATE TABLE item_user (user_id INTEGER, item_id INTEGER);
CREATE TABLE category (category_id INTEGER, name TEXT);
CREATE TABLE item_category (item_id INTEGER, category_id INTEGER);

.separator "\t"
.import raw_data/mini_proj-items.csv item
.import raw_data/mini_proj-users.csv user
.import raw_data/mini_proj-items_users.csv item_user
.import raw_data/mini_proj-categories.csv category
.import raw_data/mini_proj-categories_items.csv item_category
