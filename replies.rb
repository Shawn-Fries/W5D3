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

    def self.find_by_user_id(user_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, user_id) 
            SELECT *
            FROM replies
            WHERE author_id = ?
        SQL
        raise "No replies found for user ID #{user_id}" if replies.length == 0
        replies.map { |reply| Replies.new(reply) }
    end

    def initialize(new_reply)
        @id = new_reply["id"]
        @subject_id = new_reply["subject_id"]
        @parent_id = new_reply["parent_id"]
        @author_id = new_reply["author_id"]
        @body = new_reply["body"]
    end
end