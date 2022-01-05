require_relative 'questions_database.rb'

class User < QuestionsDatabase

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

    def self.find_by_id(id)
        User.new(QuestionsDatabase.instance.execute("SELECT * FROM users WHERE id = #{id}"))
    end

    def self.find_by_name(fname, lname)
        User.new(QuestionsDatabase.instance.execute(<<-SQL, fname, lname) 
                                                    SELECT *
                                                     FROM users 
                                                     WHERE fname = #{fname}
                                                     AND lname = #{lname}
                                                     SQL)
    end

    def initialize(new_question)
        @id = new_question['id']
        @first_name = new_question['fname']
        @last_name = new_question['lname']
    end
end