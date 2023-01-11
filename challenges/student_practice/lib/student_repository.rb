class StudentRepository

    # Selecting all records
    # No arguments
    def all
      sql = 'SELECT id, name, cohort_name FROM students;'
      result_set = DatabaseConnection.exec_params(sql, [])
      
      students = []

      result_set.each { |record| 
      student = Student.new
      student.id = record['id']
      student.name = record['name']
      student.cohort_name = record['cohort_name']
      students << student}

      return students
    end
  
    def find(id)
      sql = 'SELECT id, name, cohort_name FROM students;'
      result_set = DatabaseConnection.exec_params(sql, [])
      students = []

      result_set.each { |record| 
      student = Student.new
      student.id = record['id']
      student.name = record['name']
      student.cohort_name = record['cohort_name']
      students << student}
        return students.[id]

      # Returns a single Student object.
    end 
  
    # Add more methods below for each operation you'd like to implement.

    # creates a new student record
    # One argument: a student object
    def create(student)
        # Executes the SQL query:
        # INSERT INTO students (names, cohort_name) VALUES (':names', ':cohort_names');

        # Returns nothing
    end
    
    # updates an existing student record
    # One argument: a student object
    def update(student)
        # Executes the SQL query:
        # UPDATE students SET :cohort_name = November 2022 WHEN :id = '2';

        #Returns nothing
    end
  
    # deletes an existing student record
    # One argument: a student object    
    def delete(student)
        # Executes the SQL query:
        # DELETE FROM students WHERE :id = '3';

        #Returns nothing        
    end
end