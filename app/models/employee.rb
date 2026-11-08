class Employee < ApplicationRecord
  belongs_to :department, optional: true
  belongs_to :manager, class_name: "Employee", optional: true
  has_many :team_members, class_name: "Employee", foreign_key: "manager_id"

  scope :managers, -> { joins(:team_members).distinct }
  scope :staff, -> { left_outer_joins(:team_members).where(team_members_employees: { id: nil }) }
end
