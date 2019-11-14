require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first) # play is stored in an array!
  end

  # def self.find_by_playwright(name)
  #   playwright = Playwright.find_by_name(name)
  #   raise "#{name} not found in DB" unless playwright

  #   plays = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
  #     SELECT
  #       *
  #     FROM
  #       plays
  #     WHERE
  #       playwright_id = ?
  #   SQL

  #   plays.map { |play| Play.new(play) }
  # end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  # def insert
  #   raise "#{self} already in database" if self.id
  #   PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
  #     INSERT INTO
  #       plays (title, year, playwright_id)
  #     VALUES
  #       (?, ?, ?)
  #   SQL
  #   self.id = PlayDBConnection.instance.last_insert_row_id
  # end

  # def update
  #   raise "#{self} not in database" unless self.id
  #   PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
  #     UPDATE
  #       plays
  #     SET
  #       title = ?, year = ?, playwright_id = ?
  #     WHERE
  #       id = ?
  #   SQL
  # end
end

class Question
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0 # question is stored in an array!

    Question.new(question.first)
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless question.length > 0 # question is stored in an array!

    Question.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    User.find_by_id(author_id)
  end

  def replies

  end
  # def insert
  #   raise "#{self} already in database" if self.id
  #   PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
  #     INSERT INTO
  #       playwrights (name, birth_year)
  #     VALUES
  #       (?, ?)
  #   SQL
  #   self.id = PlayDBConnection.instance.last_insert_row_id
  # end

  # def update
  #   raise "#{self} not in database" unless self.id
  #   PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
  #     UPDATE
  #       playwrights
  #     SET
  #       name = ?, birth_year = ?
  #     WHERE
  #       id = ?
  #   SQL
  # end

  # def get_plays
  #   raise "#{self} not in database" unless self.id
  #   plays = PlayDBConnection.instance.execute(<<-SQL, self.id)
  #     SELECT
  #       *
  #     FROM
  #       plays
  #     WHERE
  #       playwright_id = ?
  #   SQL
  #   plays.map { |play| Play.new(play) }
  # end

end


class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.find_by_user_id(user_id)
    question_follow = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        user_id = ?
    SQL
    return nil unless question_follow.length > 0 # question_follow is stored in an array!

    QuestionFollow.new(question_follow.first)
  end

  def self.find_by_question_id(question_id)
    question_follow = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_id = ?
    SQL
    return nil unless question_follow.length > 0 # question_follow is stored in an array!

    QuestionFollow.new(question_follow.first)
  end

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

class Questionlike
 attr_accessor :id, :user_id, :question_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLike.new(datum) }
  end

  def self.find_by_id(id)
    question_like = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil unless question_like.length > 0 # question_like is stored in an array!

    QuestionLike.new(question_like.first)
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

class Reply
 attr_accessor :reply_id, :op_question_id, :parent_reply_id, :user_id, :body

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_user_id(user_id)
    
  end

  def self.find_by_question_id(question_id)

  end

  def self.find_by_reply_id(reply_id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_id = ?
    SQL
    return nil unless reply.length > 0 # reply is stored in an array!

    Reply.new(reply.first)
  end

  def initialize(options)
    @reply_id = options['reply_id']
    @op_question_id = options['op_question_id']
    @parent_reply_id = options['parent_reply_id']
    @user_id = options['user_id']
    @body = options['body']
  end
end