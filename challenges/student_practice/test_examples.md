# EXAMPLES

# 1
# Get all students

repo = StudentRepository.new

students = repo.all

students.length # =>  2

students[0].id # =>  1
students[1].id # =>  2

# 2
# Get a single student

repo = StudentRepository.new

student = repo.find(1)

student.id # =>  1
student.name # =>  'David'
student.cohort_name # =>  'April 2022'

# 3
# Create a single student

new_student = Student.new
new_student.name = 'Joy'
new_student.cohort_name = 'June 2022'

# 4
# Updates a single student

repo = StudentRepository.new

student = repo.update(2)

student.id # =>  2
student.name # =>  'Anna'

# 5
# Delete a single student

repo = StudentRepository.new

student = repo.delete(3)
