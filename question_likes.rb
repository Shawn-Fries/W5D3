require_relative 'questions_database.rb'

class QuestionLikes
    attr_accessor :id, :user_id, :question_id

    def self.find_by_id(id)
        likes = QuestionsDatabase.instance.execute(<<-SQL, id) 
            SELECT *
            FROM question_likes
            WHERE id = ?
        SQL
        raise "Likes ID #{id} not in database" if likes.length == 0
        QuestionLikes.new(likes.first)
    end

    def initialize(new_likes)
        @id = new_likes["id"]
        @user_id = new_likes["user_id"]
        @question_id = new_likes["question_id"]
    end
end