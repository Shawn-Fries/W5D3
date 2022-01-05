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
    question INTEGER NOT NULL
    user INTEGER NOT NULL

    
)

