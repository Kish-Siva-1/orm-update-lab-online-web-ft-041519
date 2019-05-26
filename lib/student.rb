require_relative "../config/environment.rb"
require 'pry'

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  
  attr_accessor :id, :name, :grade
  
  def initialize(id = nil, name, grade)
    @id = id 
    @name = name 
    @grade = grade
  end 

  def self.create_table 
    
    sql = <<-SQL 
          CREATE TABLE IF NOT EXISTS students ( 
          id INTEGER PRIMARY KEY,
          name TEXT,
          grade TEXT 
          )
          SQL
    
    DB[:conn].execute(sql)
    
  end 
  
  def self.drop_table 
    sql = <<-SQL 
          DROP TABLE IF EXISTS students
          SQL
    
    DB[:conn].execute(sql)
  end 
  
  def save 
  
    if !self.id
      sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?, ?)
      SQL
   
      DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]  
    else 
      sql = <<-SQL
      UPDATE students SET name = ?, grade = ? 
      SQL
      DB[:conn].execute(sql, self.name, self.grade)
      binding.pry  
    end 
    
  end 
  
  def self.create 
    
  end 
  
  def self.new_from_db 
    
  end 
  
  def self.find_by_name 
    
  end 
  
  def update 
    
  end 
  
end
