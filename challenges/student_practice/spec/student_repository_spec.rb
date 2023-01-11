require "student_repository"
require "student"

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'student_test' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end
  it "gets all students" do
    repo = StudentRepository.new
    students = repo.all
    expect(students.length).to eq 2
    expect(students[0].id).to eq '1'
    expect(students[1].id).to eq '2'
  end

  it "gets a single student" do
    repo = StudentRepository.new
    students = repo.all
    expect(repo.find(1)).to eq '1'
  end
  
end