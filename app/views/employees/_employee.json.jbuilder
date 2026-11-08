json.extract! employee, :id, :name, :email, :employee_id, :status, :age, :department_id, :manager_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
