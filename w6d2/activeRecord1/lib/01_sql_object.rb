require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
   return @columns if @columns 
    columns = DBConnection.execute2(<<-SQL).first 

    SELECT 
    *
    FROM 
    #{self.table_name} 
  
  SQL

   columns.map!(&:to_sym)
   @columns = columns 
 
  end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do 
 
        self.attributes[name]
      end

      define_method("#{name}=") do |value|
      self.attributes[name] = value 
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.pluralize.downcase 
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
    SELECT
     #{table_name}.*
    FROM 
     #{table_name} 
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map {|res| self.new(res)} #change hash to obj.
  end
  

  def self.find(id)
     results = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
    SQL

    parse_all(results).first #this is an array, inside is object
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values

    self.class.columns.map{|attr| self.send(attr) }
    #self is the instance of Cat 
    #self.class is the Cat 
    #self.class.columns = [:id, :name, :owner_id]
    #self.send(method_name)
  end

  def insert
    columns = self.class.columns.drop(1)
    #columns = [:name, :owner_id]
    col_names = columns.map(&:to_s).join(", ")
    #col_names = "name, owner_id"
    question_marks = (["?"] * columns.count).join(", ")
    #question_marks = "?, ?"

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO 
        #{self.class.table_name} (#{col_names})
      VALUES 
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id 
    #last_insert_row_id ===> sql build-in method 
  end

  def update
   set_line = self.class.columns
    .map{|attr| "#{attr} = ?"}.join(", ")
    debugger 
    DBConnection.execute(<<-SQL, *attribute_values, id)
    UPDATE
    #{self.class.table_name}
    SET
    #{set_line}
    WHERE
    #{self.class.table_name}.id = ?
  
    SQL

  end

  def save
    if id.nil?
      insert
    else
      update
    end
  end
end
