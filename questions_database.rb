require 'sqlite3'
require 'singleton'

SQLite3::Database.new( "questions.db" ) do |db|
  db.execute( "select * from users" ) do |row|
    p row
  end
end

class QuestionsDatabase < SQLite3::Database
    include Singleton
end