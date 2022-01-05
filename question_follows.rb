require_relative 'questions_database.rb'

class QuestionFollows
    attr_accessor :id, :question_id, :user_id

    def self.find_by_id(id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        raise "Question follows for ID #{id} not found" if question_follows.length == 0
        QuestionFollows.new(question_follows.first)
    end

    def self.find_by_question_and_user(question_id, user_id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, question_id, user_id) 
            SELECT *
            FROM question_follows 
            WHERE question_id = ?
            AND user_id = ?
        SQL
        raise "Question follows for question ID #{question_id} and user ID #{user_id} not in database" if question_follows.length == 0
        QuestionFollows.new(question_follows.first)
    end

    def initialize(new_question_follows)
        @id = new_question_follows["id"]
        @question_id = new_question_follows["question_id"]
        @user_id = new_question_follows["user_id"]
    end
end