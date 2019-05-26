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
          grade INTEGER 
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
    @id = 1

    sql = "UPDATE students SET name = ?, grade = ?"
    
    DB[:conn].execute(sql, self.name, self.grade)
    
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
