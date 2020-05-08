# require_relative 'question_follows'
# require_relative 'question'
# require_relative 'question_likes'
require_relative 'questions_database'
# require_relative 'replies'

require 'byebug'
class User

    def self.find_all
        #user_data = QuestionDatabase.instance.execute(SELECT users.id FROM users)re
        # user_data = QuestionsDatabase.instance #{id => 1, }  #instance of the database 
      
        user_data = QuestionsDatabase.instance.execute(<<-SQL) 
        SELECT
            *
        FROM
            users
       
        SQL
       debugger
        return nil if user_data.nil?
        # User.new(user_data)
        user_data.map{|use| User.new(use)}
    end

    def initialize(options)
        @id = options['id']
        @f_name = options['f_name']
        @l_name = options['l_name']    
    end

#0 Wendy Lastname {id = >1, fname => fname, lname = lname}
# id  f_name  l_name
#  0   wendy    kuang 
#  1    Anna     cho
    def self.find_by_name(f_name, l_name)
        user_data.get_first_row(<<-SQL, f_name, l_name)
        SELECT
            *
        FROM
            users
        WHERE
            users.fname = f_name AND users.lname = l_name
        SQL
        return nil if user_data.nil?
        User.new(user_data)

    end

end

user1 = User.find_all