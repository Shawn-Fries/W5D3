require_relative 'questions_database.rb'

class Question
    def initialize(new_question)
        @first_name = new_question['fname']
        @last_name = new_question['lname']
    end

    def self.find_by_id
        Question.new
    end
end