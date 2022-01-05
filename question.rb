class Question
    attr_accessor :id, :title, :body, :associated_author

    def self.all

    end

    def self.find_by_id

    end

    def self.find_by_title

    end

    def initialize(question)
        @id = question["id"]
        @title = question["title"]
        @body = question["body"]
        @associated_author = question["associated_author"]
    end
end 