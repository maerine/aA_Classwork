PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
DROP TABLE if exists questions;
DROP TABLE if exists question_follows;
DROP TABLE if exists replies;
DROP TABLE if exists question_likes;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Eddie', 'Xiao'), --1
  ('Mae', 'Rine'); --2


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('SQL', 'What is SQL?', 2), --1
  ('Rails', 'What is Rails?', 1); --2


CREATE TABLE question_follows (
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 2),
  (2, 1);


CREATE TABLE replies (
  reply_id INTEGER PRIMARY KEY,
  op_question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER,
  body VARCHAR(255),

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (op_question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(reply_id)
);

INSERT INTO
  replies
  (op_question_id, parent_reply_id, user_id, body)
VALUES
  (1, null, 1, 'Structred query language'),
  (2, null, 1, 'nevermind I figured it out!');

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes
  (question_id, user_id)
VALUES
  (1,1),
  (2,2);