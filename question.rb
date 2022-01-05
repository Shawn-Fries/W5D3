require_relative 'questions_database.rb'

class Question
    attr_accessor :id, :title, :body, :associated_author

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT *
            FROM questions
            WHERE id = ?
        SQL
        raise "ID #{id} not in database" if question.length == 0
        Question.new(question.first)
    end

    def self.find_by_title(title)
        question = QuestionsDatabase.instance.execute(<<-SQL, title)
            SELECT *
            FROM questions
            WHERE title = ?
        SQL
        raise "#{title} not in database" if question.length == 0
        Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT *
            FROM questions
            WHERE associated_author_id = ?
        SQL
        raise "Author ID #{author_id} not in database" if question.length == 0
        Question.new(question.first)
    end

    def initialize(question)
        @id = question["id"]
        @title = question["title"]
        @body = question["body"]
        @associated_author = question["associated_author"]
    end
end 