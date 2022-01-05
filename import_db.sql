PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY
    fname VARCHAR(255) NOT NULL
    lname VARCHAR(255) NOT NULL
)

CREATE TABLE questions (
    id INTEGER PRIMARY KEY
    title VARCHAR(255) NOT NULL
    body VARCHAR(255) NOT NULL
    associated_author INTEGER NOT NULL

    FOREIGN KEY (associated_author) REFERENCES users(id)
)

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY
    question_id INTEGER NOT NULL
    user_id INTEGER NOT NULL

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (user_id) REFERENCES users(id)
)

CREATE TABLE replies (  
    id INTEGER PRIMARY KEY
    subject_question_id INTEGER NOT NULL
    parent_reply_id INTEGER
    author_id INTEGER NOT NULL
    body VARCHAR(255) NOT NULL

    FOREIGN KEY (subject_question_id) REFERENCES questions(id)
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
    FOREIGN KEY (author_id) REFERENCES users(id)
)

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY
    user_id INTEGER NOT NULL
    question_id INTEGER NOT NULL

    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
)

INSERT INTO
    users (fname, lname)
VALUES
    ('Shawn', 'Fries'),
    ('Ethan', 'Gumin')

INSERT INTO
    questions (title, body, associated_author)
VALUES
    ("How do I create a SQL database?", "See Title", )

