# db/seeds.rb

# Departments
it_dept     = Department.find_or_create_by!(name: "IT")
hr_dept     = Department.find_or_create_by!(name: "HR")

# Managers
raja = Employee.create!(
  employee_id: "M001",
  name: "Raja",
  email: "raja.manager@example.com",
  status: "Active",
  age: 42,
  department: it_dept
)

sita = Employee.create!(
  employee_id: "M002",
  name: "Sita",
  email: "sita.manager@example.com",
  status: "Active",
  age: 38,
  department: hr_dept
)

# Employees under Raja (IT)
Employee.create!(employee_id: "E001", name: "IT Employee Active 1", email: "it.active1@example.com", status: "Active", age: 28, department: it_dept, manager: raja)
Employee.create!(employee_id: "E002", name: "IT Employee Active 2", email: "it.active2@example.com", status: "Active", age: 30, department: it_dept, manager: raja)
Employee.create!(employee_id: "E003", name: "IT Employee Inactive 1", email: "it.inactive1@example.com", status: "Inactive", age: 27, department: it_dept, manager: raja)

# Employees under Sita (HR)
Employee.create!(employee_id: "E004", name: "HR Employee Active 1", email: "hr.active1@example.com", status: "Active", age: 28, department: hr_dept, manager: sita)
Employee.create!(employee_id: "E005", name: "HR Employee Active 2", email: "hr.active2@example.com", status: "Active", age: 29, department: hr_dept, manager: sita)
Employee.create!(employee_id: "E006", name: "HR Employee Inactive 1", email: "hr.inactive1@example.com", status: "Inactive", age: 32, department: hr_dept, manager: sita)

