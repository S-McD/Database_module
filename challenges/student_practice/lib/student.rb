class Student
    # Replace the attributes by your own columns.
    attr_accessor :id, :name, :cohort_name
end
  
  # The keyword attr_accessor is a special Ruby feature
  # which allows us to set and get attributes on an object,
  # here's an example:
  #
  # student = Student.new
  # student.name = 'Jo'
  # student.name
