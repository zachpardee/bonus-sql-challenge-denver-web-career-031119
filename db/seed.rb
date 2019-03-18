# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require "sqlite3"
require "csv"
require "pry"
# require_relative "../daily_show_guests.csv"

db = SQLite3::Database.new "daily_show_db.db"
binding.pry
# Create a database
rows = db.execute <<-SQL
  create table daily_show_guests (
    year INTEGER,
    occupation TEXT,
    show_date TEXT,
    group TEXT,
    guest_list TEXT
  );
SQL

csv = daily_show_guests.csv
# CSV

CSV.parse(csv, headers: true) do |row|
  db.execute "insert into users values ( ?, ? )", row.fields # equivalent to: [row['name'], row['age']]
end

db.execute( "select * from daily_show_guests" ) # => [["ben", 12], ["sally", 39]]
