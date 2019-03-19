# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require "sqlite3"
require "csv"
require "pry"
require_relative '../config/environment'
# require_relative "../daily_show_guests.csv"

DB.execute("DROP TABLE IF EXISTS daily_show_guests")
# Create a table
row = DB.execute <<-SQL
  CREATE TABLE daily_show_guests (
    year TEXT,
    occupation TEXT,
    show_date TEXT,
    type TEXT,
    guest_list TEXT
  );
SQL

csv = "../daily_show_guests.csv"

# Seed DB from CSV
CSV.foreach(csv, headers: true) do |row|
  DB.execute "INSERT INTO daily_show_guests(year, occupation, show_date, type, guest_list) VALUES (?,?,?,?,?)", row.fields # equivalent to: [row['name'], row['age']]
end
DB.execute( "select * from daily_show_guests")
