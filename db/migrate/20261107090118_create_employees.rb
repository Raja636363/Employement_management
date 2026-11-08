class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :employee_id
      t.string :status
      t.integer :age
      t.references :department, null: false, foreign_key: true
      t.integer :manager_id

      t.timestamps
    end
  end
end
