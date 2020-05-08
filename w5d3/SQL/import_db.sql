-- DROP TABLE IF EXISTS
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
    users (fname, lname)
VALUES
    ("Wendy", "Kuang"), ("Anna", "Cho"), ("Julia","Wang");


--------

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL, 

    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    questions (title, body, author_id)
SELECT
    "Wendy Question", "hahaha", users.id
FROM
    users
WHERE
    users.fname = "Wendy" AND users.lname = "Kuang";

INSERT INTO
    questions (title, body, author_id)
SELECT
    "Anna Question", "what is an integer", users.id
FROM
    users
WHERE
    users.fname = "Anna" AND users.lname = "Cho";

INSERT INTO
    questions (title, body, author_id)
SELECT
    "Julia Question", "Hello no questions", users.id
FROM
    users
WHERE
    users.fname = "Julia" AND users.lname = "Wang";




CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY, 
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    question_follows (user_id, question_id)
VALUES 
    ((SELECT id FROM users WHERE fname = 'Wendy' AND lname = 'Kuang'),

    (SELECT id FROM  questions WHERE title = "Wendy Question")),

    ((SELECT id FROM users WHERE fname = 'Anna' AND lname = 'Cho'),

    (SELECT id FROM questions WHERE title = "Anna Question")),

    ((SELECT id FROM users WHERE fname = 'Julia' AND lname = 'Wang'),
     (SELECT id FROM questions WHERE title = "Julia Question"));

 
 CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
 );

INSERT INTO
    replies (question_id, parent_reply_id, author_id, body)
VALUES
    ((SELECT id FROM questions WHERE title = "Wendy Question"), 
     NULL,
     (SELECT id FROM users WHERE fname = "Wendy" AND lname = "Kuang"),
     "Oh Hi" 
     );

INSERT INTO
    replies (question_id, parent_reply_id, author_id, body)
VALUES
    ((SELECT id FROM questions WHERE title = "Wendy Question"), 
     (SELECT id FROM replies WHERE body = "Oh Hi"),
     (SELECT id FROM users WHERE fname = "Wendy" AND lname = "Kuang"),
     "Oh good to see you" 
     );

-----------------------------

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    question_likes(user_id, question_id)
VALUES 
    ((SELECT id FROM users WHERE fname = 'Anna' AND lname = 'Cho'),
    (SELECT id FROM questions WHERE title = 'Wendy Question')
);

