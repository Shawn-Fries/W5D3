require_relative 'questions_database.rb'

class User < QuestionsDatabase

    #def self.find_by_id
    #    User.instance.
    #end

    def initialize(new_question)
        @first_name = new_question['fname']
        @last_name = new_question['lname']
    end
end