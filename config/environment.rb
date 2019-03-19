require 'bundler'
Bundler.require

# Setup a DB connection here
DB = SQLite3::Database.new "../db/daily_show_db.db"
