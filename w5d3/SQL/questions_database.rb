require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    SQL_FILE = File.join(File.dirname(__FILE__), "import_db.sql")
    DATABASE = File.join(File.dirname(__FILE__), "questions.db") 
    
    def initialize
        super(DATABASE)
        self.type_translation = true
        self.results_as_hash = true
    end

    # def self.open #set database variable
    #     @database = SQLite3::Database.new(DATABASE)
    #     @database.type_translation = true
    #     @database.results_as_hash = true  
    # end

    # def self.instance #return database
    #     @database 
    # end

end