require_relative 'questions_database.rb'

class QuestionLikes

    def self.find_by_id(id)
        likes = QuestionsDatabase.instance.execute(<<-SQL, id) 
            SELECT *
            FROM question_likes
            WHERE id = ?
        SQL
        raise "Likes ID #{id} not in database" if likes.length == 0
        QuestionLikes.new(likes.first)
    end
end