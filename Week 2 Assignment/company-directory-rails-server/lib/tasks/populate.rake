# Call this with "bundle exec rake db:populate"

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_departments
    puts "Departments:"
    puts Department.all
    make_employees
  end
end


def make_departments
  department_number = 1
  20.times do
    department_number += 1
    Department.create!(:name => department_name)
  end
end

def make_employees
  departments = Department.all
  100.times do |n|
    name = Faker::Name.name
    salary = 150000
    job_title = 'Engineer'
    birthday = Date.today
    number_of_departments = departments.length
    department = departments[n % number_of_departments]
    emp = Employee.create(:name => name,
                          :job_title => job_title,
                          :salary => salary,
                          :birthday => birthday)
    emp.department = department
    emp.save!
  end
end
