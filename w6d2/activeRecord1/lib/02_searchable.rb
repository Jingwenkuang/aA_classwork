require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    where_line = params.keys.map{|key| "#{key} = ?"}.join(" AND ")
 #where_line = "fname = ? AND lname = ?"
 #params = {:fname=>"Nowhere", :lname=>"Man"}

    results = DBConnection.execute(<<-SQL, *params.values)

      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_line}
    SQL

#results = [{"id"=>1, "fname"=>"Devon", "lname"=>"Watts", "house_id"=>1},
# {"id"=>2, "fname"=>"Matt", "lname"=>"Rubens", "house_id"=>1}]

    parse_all(results)
#parse_all(results) = [#<Human:0x00007f982aa3e8b8 @attributes={:id=>1, :fname=>"Devon", :lname=>"Watts", :house_id=>1}>, 
#<Human:0x00007f982aa3e728 @attributes={:id=>2, :fname=>"Matt", :lname=>"Rubens", :house_id=>1}>]
  end
end

class SQLObject
  extend Searchable
end
