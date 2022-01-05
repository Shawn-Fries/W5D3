require_relative 'questions_database.rb'

class User
    attr_accessor :id, :first_name, :last_name

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id) 
            SELECT *
            FROM users 
            WHERE id = ?
        SQL
        raise "User ID #{id} not in database" if user.length == 0
        User.new(user.first)
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname) 
            SELECT *
            FROM users 
            WHERE fname = ?
            AND lname = ?
        SQL
        raise "User #{fname} #{lname} not in database" if user.length == 0
        User.new(user.first)
    end

    def initialize(new_user)
        @id = new_user['id']
        @first_name = new_user['fname']
        @last_name = new_user['lname']
    end
end