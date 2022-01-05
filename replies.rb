require_relative 'questions_database.rb'

class Replies
    attr_accessor :id, :subject_id, :parent_id, :author_id, :body

    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id) 
            SELECT *
            FROM replies
            WHERE id = ?
        SQL
        raise "Reply ID #{id} not in database" if reply.length == 0
        Replies.new(reply.first)
    end
end